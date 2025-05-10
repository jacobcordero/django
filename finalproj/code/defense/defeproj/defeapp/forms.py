# predictor/forms.py
from django import forms

# Define choices based on your dataset's unique values
GENDER_CHOICES = [('Female', 'Female'), ('Male', 'Male'), ('Other', 'Other')]
YES_NO_CHOICES = [('Yes', 'Yes'), ('No', 'No')]
DIET_CHOICES = [('Good', 'Good'), ('Fair', 'Fair'), ('Poor', 'Poor')]
EDUCATION_CHOICES = [('None', 'None'), ('High School', 'High School'), ('Bachelor', 'Bachelor'), ('Master', 'Master')]
INTERNET_CHOICES = [('Poor', 'Poor'), ('Average', 'Average'), ('Good', 'Good')]

class StudentHabitForm(forms.Form):
    age = forms.IntegerField(min_value=15, max_value=30, label="Age")
    gender = forms.ChoiceField(choices=GENDER_CHOICES, label="Gender")
    study_hours_per_day = forms.FloatField(min_value=0.0, max_value=10.0, label="Study Hours per Day")
    social_media_hours = forms.FloatField(min_value=0.0, max_value=10.0, label="Social Media Hours per Day")
    netflix_hours = forms.FloatField(min_value=0.0, max_value=10.0, label="Netflix Hours per Day")
    part_time_job = forms.ChoiceField(choices=YES_NO_CHOICES, label="Has Part-Time Job?")
    attendance_percentage = forms.FloatField(min_value=0.0, max_value=100.0, label="Attendance Percentage")
    sleep_hours = forms.FloatField(min_value=2.0, max_value=12.0, label="Sleep Hours per Night")
    diet_quality = forms.ChoiceField(choices=DIET_CHOICES, label="Diet Quality")
    exercise_frequency = forms.IntegerField(min_value=0, max_value=7, label="Exercise Frequency (days/week)")
    parental_education_level = forms.ChoiceField(choices=EDUCATION_CHOICES, label="Parental Education Level")
    internet_quality = forms.ChoiceField(choices=INTERNET_CHOICES, label="Internet Quality")
    mental_health_rating = forms.IntegerField(min_value=1, max_value=10, label="Mental Health Rating (1-10)")
    extracurricular_participation = forms.ChoiceField(choices=YES_NO_CHOICES, label="Participates in Extracurriculars?")

    # Add help text if desired
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['study_hours_per_day'].help_text = "e.g., 2.5"
        self.fields['social_media_hours'].help_text = "e.g., 3.0"
        self.fields['netflix_hours'].help_text = "e.g., 1.5"
        self.fields['attendance_percentage'].help_text = "e.g., 92.5"
        self.fields['sleep_hours'].help_text = "e.g., 7.5"