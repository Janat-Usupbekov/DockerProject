from django.urls import path
from .views import car_list, car_detail, car_create, car_edit, car_delete

urlpatterns = [
    path('', car_list, name='car_list'),
    path('cars/<int:pk>/', car_detail, name='car_detail'),
    path('cars/new/', car_create, name='car_create'),
    path('cars/<int:pk>/edit/', car_edit, name='car_edit'),
    path('cars/<int:pk>/delete/', car_delete, name='car_delete'),
]
