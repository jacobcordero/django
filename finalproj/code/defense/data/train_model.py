import pickle
import pandas as pd
import numpy as np
import os # For path joining

from sklearn.model_selection import train_test_split
from sklearn.preprocessing import MinMaxScaler, OrdinalEncoder # Changed from LabelEncoder
from sklearn.linear_model import LinearRegression
from sklearn.impute import SimpleImputer
from sklearn.metrics import mean_squared_error, r2_score
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline

# --- Define paths ---
# Path to the directory containing this script
_script_dir = os.path.dirname(os.path.abspath(__file__))
# Path to the project root (assuming 'data' is one level down from project root that contains 'defeproj')
# e.g., if script is in 'c:\xampp\htdocs\defense\data', project_root is 'c:\xampp\htdocs\defense'
_project_root_approx = os.path.dirname(_script_dir)
# Path to where the pipeline should be saved in the Django app
_django_app_model_dir = os.path.join(_project_root_approx, 'defeproj', 'defeapp', 'ml_models')
PIPELINE_NAME = "pipeline_dt.pkl" # This should match what apps.py tries to load
PIPELINE_PATH = os.path.join(_django_app_model_dir, PIPELINE_NAME)


# Load dataset
df = pd.read_csv('student_habits_performance.csv')

# Drop ID column if it exists
if 'id' in df.columns:
    df.drop(columns=['id'], inplace=True)

TARGET_COLUMN = 'exam_score'

# Separate features and target
X = df.drop(TARGET_COLUMN, axis=1)
y = df[TARGET_COLUMN]

# Identify categorical and numerical features
categorical_features = X.select_dtypes(include='object').columns.tolist()
numerical_features = X.select_dtypes(include=np.number).columns.tolist()

# Create preprocessing pipelines for numerical and categorical features
numerical_pipeline = Pipeline(steps=[
    ('imputer', SimpleImputer(strategy='mean')), # Impute NaNs with mean
    ('scaler', MinMaxScaler())
])

categorical_pipeline = Pipeline(steps=[
    ('imputer', SimpleImputer(strategy='constant', fill_value='missing')), # Impute NaNs with 'missing'
    ('encoder', OrdinalEncoder(handle_unknown='use_encoded_value', unknown_value=-1)) # -1 for unknown/missing
])

# Create preprocessor using ColumnTransformer
# OrdinalEncoder will convert string categories to numerical representations.
# MinMaxScaler will scale numerical features.
preprocessor = ColumnTransformer(
    transformers=[
        ('cat', categorical_pipeline, categorical_features),
        ('num', numerical_pipeline, numerical_features)
    ],
    remainder='passthrough' # Ensures any columns not explicitly handled are passed through (or use 'drop')
)

# Create the full machine learning pipeline
model_pipeline = Pipeline(steps=[
    ('preprocessor', preprocessor),
    ('regressor', LinearRegression())
])

# Train/test split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Train model
model_pipeline.fit(X_train, y_train)

# Evaluate
y_pred = model_pipeline.predict(X_test)
print("R2 Score:", r2_score(y_test, y_pred))
print("MSE:", mean_squared_error(y_test, y_pred))

# Ensure the target directory for the pipeline exists
os.makedirs(_django_app_model_dir, exist_ok=True)

# Save the single pipeline object
with open(PIPELINE_PATH, "wb") as f:
    pickle.dump(model_pipeline, f)
print(f"Pipeline saved to {PIPELINE_PATH}")

# The old way of saving individual components is no longer needed.
# print(f"Categorical features used by pipeline: {categorical_features}")
# print(f"Numerical features used by pipeline: {numerical_features}")