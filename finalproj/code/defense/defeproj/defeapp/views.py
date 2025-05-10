from django.shortcuts import render
from .models import Prediction
from django.apps import apps
import pandas as pd
import numpy as np # For int conversion if needed
from django.contrib.auth import authenticate, login, logout
from django.shortcuts import redirect
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required

@login_required(login_url='/sign_in/')
def predict_score(request):
    if request.method == 'POST':
        try:
            # Extract raw input data from POST request, keeping categoricals as strings
            # The keys must match the column names in the CSV used for training.
            raw_form_data = {
                'student_id': 0,
                'age': int(request.POST.get('age')),
                'gender': request.POST.get('gender'), # String e.g. "Male", "Female"
                'study_hours_per_day': float(request.POST.get('study_hours_per_day')), # Key from form/training
                'social_media_hours': float(request.POST.get('social_media_hours')), # Key from form/training
                'netflix_hours': float(request.POST.get('netflix_hours')), # Key from form/training
                'part_time_job': request.POST.get('part_time_job'), # String e.g. "Yes", "No"
                'attendance_percentage': float(request.POST.get('attendance_percentage')),
                'sleep_hours': float(request.POST.get('sleep_hours')),
                'diet_quality': request.POST.get('diet_quality'), # String
                'exercise_frequency': int(request.POST.get('exercise_frequency')),
                'parental_education_level': request.POST.get('parental_education_level'), # String
                'internet_quality': request.POST.get('internet_quality'), # String
                'mental_health_rating': int(request.POST.get('mental_health_rating')),
                'extracurricular_participation': request.POST.get('extracurricular_participation') # String
            }

            # Retrieve the ML pipeline from AppConfig
            complete_pipeline = apps.get_app_config('defeapp').ml_pipeline
            if not complete_pipeline:
                return render(request, 'predict_form.html', {'error': 'ML pipeline is not available.'})

            # Prepare input_data as a pandas DataFrame with correct column names
            # The pipeline expects raw string values for categorical features.
            input_df = pd.DataFrame([raw_form_data])

            # Make prediction using the full pipeline
            prediction_result = complete_pipeline.predict(input_df)[0]

            # --- Prepare data for saving to the Prediction model ---
            # The Prediction model expects IntegerFields for categorical data.
            # The pipeline's preprocessor (OrdinalEncoder) converts strings to these integers.
            # We need to extract these transformed values.
            data_for_db = raw_form_data.copy() # Start with raw data

            # Get the preprocessor step from the pipeline
            preprocessor_step = complete_pipeline.named_steps.get('preprocessor')
            if preprocessor_step:
                # Transform the input_df to get encoded/scaled values
                transformed_values_array = preprocessor_step.transform(input_df)

                # Get the feature names output by the ColumnTransformer's components
                # This relies on the structure defined in train_model.py's ColumnTransformer
                cat_transformer = preprocessor_step.named_transformers_.get('cat')
                
                if cat_transformer:
                    categorical_features_in_order = cat_transformer.feature_names_in_
                    # The OrdinalEncoder outputs one column for each input categorical feature.
                    # These will be the first columns in transformed_values_array.
                    for i, feature_name in enumerate(categorical_features_in_order):
                        if feature_name in data_for_db: # Ensure the feature is expected by DB model
                            data_for_db[feature_name] = int(transformed_values_array[0, i])
                
                # Note: If you also need to store scaled numerical values, you'd extract them similarly.
                # For now, Prediction model uses original scale for numericals from raw_form_data.
                # If Prediction model expects scaled numericals, extract them from transformed_values_array too.

            # Save the prediction to the database
            prediction = Prediction.objects.create(
                age=data_for_db['age'],
                gender=data_for_db['gender'], # Now an integer from OrdinalEncoder
                study_hours_per_day=data_for_db['study_hours_per_day'],
                social_media_hours=data_for_db['social_media_hours'],
                netflix_hours=data_for_db['netflix_hours'],
                part_time_job=data_for_db['part_time_job'], # Now an integer
                attendance_percentage=data_for_db['attendance_percentage'],
                sleep_hours=data_for_db['sleep_hours'],
                diet_quality=data_for_db['diet_quality'], # Now an integer
                exercise_frequency=data_for_db['exercise_frequency'],
                parental_education_level=data_for_db['parental_education_level'], # Now an integer
                internet_quality=data_for_db['internet_quality'], # Now an integer
                mental_health_rating=data_for_db['mental_health_rating'],
                extracurricular_participation=data_for_db['extracurricular_participation'], # Now an integer
                prediction_result=prediction_result
            )
            # Render the result template with the prediction
            return render(request, 'predict_result.html', {'prediction': prediction})

        except Exception as e:
            return render(request, 'predict_form.html', {'error': str(e)})

    return render(request, 'predict_form.html')

def sign_up(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        email = request.POST.get('email')
        password = request.POST.get('password')

        if User.objects.filter(username=username).exists():
            return render(request, 'sign_up.html', {'error': 'Username already exists.'})

        user = User.objects.create_user(username=username, email=email, password=password)
        user.save()
        return redirect('sign_in')

    return render(request, 'sign_up.html')

def sign_in(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('dashboard')
        else:
            return render(request, 'sign_in.html', {'error': 'Invalid username or password.'})

    return render(request, 'sign_in.html')

def sign_out(request):
    logout(request)
    return redirect('sign_in')

@login_required(login_url='/sign_in/')
def dashboard(request):
    predictions = Prediction.objects.all()
    return render(request, 'dashboard.html', {'predictions': predictions})
