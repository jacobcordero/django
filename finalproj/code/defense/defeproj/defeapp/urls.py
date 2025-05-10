from django.urls import path
from . import views

urlpatterns = [
    path('predict/', views.predict_score, name='predict_score'),
    path('', views.predict_score, name='predict_home'),
    path('sign_up/', views.sign_up, name='sign_up'),
    path('sign_in/', views.sign_in, name='sign_in'),
    path('sign_out/', views.sign_out, name='sign_out'),
    path('dashboard/', views.dashboard, name='dashboard'),
]