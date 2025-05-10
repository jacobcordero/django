from django.apps import AppConfig
import os
import pickle
from django.conf import settings


class DefeappConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'defeapp'
    ml_pipeline = None  # Attribute to store the loaded ML pipeline

    def ready(self):
        # This method is called once Django starts and all apps are initialized.
        # We load the ML pipeline here.
        print(f"[{self.name}] AppConfig: ready() method called.") # Log app name
        # Load the pipeline only if it hasn't been loaded yet (e.g. to prevent re-loading during tests)
        if not DefeappConfig.ml_pipeline:
            DefeappConfig.ml_pipeline = load_ml_pipeline()
            if DefeappConfig.ml_pipeline:
                print(f"[{self.name}] AppConfig: ML Pipeline successfully attached.")
            else:
                print(f"[{self.name}] AppConfig: ML Pipeline could NOT be loaded or attached.")

# Utility function to load the ML pipeline
def load_ml_pipeline():
    model_path = os.path.join(settings.BASE_DIR, 'defeapp', 'ml_models', 'pipeline_dt.pkl')
    try:
        with open(model_path, 'rb') as f:
            pipeline = pickle.load(f)
        return pipeline
    except FileNotFoundError:
        print(f"Error: Model file not found at {model_path}.")
        return None
    except Exception as e:
        print(f"Error loading model pipeline: {e}")
        return None
