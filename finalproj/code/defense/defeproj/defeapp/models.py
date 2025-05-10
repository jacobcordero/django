from django.db import models

class Accounts(models.Model):
    username = models.CharField(max_length=255)
    email = models.CharField(max_length=255)
    password = models.CharField(max_length=255)

class Prediction(models.Model):
    user = models.ForeignKey(Accounts, on_delete=models.SET_NULL, null=True, blank=True)

    # Student habit fields
    age = models.IntegerField()
    gender = models.IntegerField()
    study_hours_per_day = models.FloatField()
    social_media_hours = models.FloatField()
    netflix_hours = models.FloatField()
    part_time_job = models.IntegerField()
    attendance_percentage = models.FloatField()
    sleep_hours = models.FloatField()
    diet_quality = models.IntegerField()
    exercise_frequency = models.IntegerField()
    parental_education_level = models.IntegerField()
    internet_quality = models.IntegerField()
    mental_health_rating = models.IntegerField()
    extracurricular_participation = models.IntegerField()

    # Prediction result
    prediction_result = models.FloatField(null=True, blank=True)

    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Prediction #{self.id} - {self.created_at}"
