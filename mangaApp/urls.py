from django.urls import path
from . import views

urlpatterns = [
    path('', views.pagina_inicio, name='inicio'),
    path('tomos/', views.listar_tomos, name='listar_tomos'),
    path('tomos/', views.listar_tomos, name='lista_tomos'),
    path('tomos/nuevo/', views.crear_tomo, name='crear_tomo'),
    path('tomos/editar/<int:pk>/', views.editar_tomo, name='editar_tomo'),
    path('tomos/eliminar/<int:pk>/', views.eliminar_tomo, name='eliminar_tomo'),
]