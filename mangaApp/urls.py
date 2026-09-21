from django.urls import path
from . import views

urlpatterns = [
    path('', views.pagina_inicio, name='inicio'),
    # Tomos
    path('tomos/', views.listar_tomos, name='listar_tomos'),
    path('tomos/', views.listar_tomos, name='lista_tomos'),
    path('tomos/nuevo/', views.crear_tomo, name='crear_tomo'),
    path('tomos/editar/<int:pk>/', views.editar_tomo, name='editar_tomo'),
    path('tomos/eliminar/<int:pk>/', views.eliminar_tomo, name='eliminar_tomo'),

    # Series
    path('series/', views.listar_series, name='listar_series'),
    path('series/nuevo/', views.crear_serie, name='crear_serie'),
    path('series/editar/<int:pk>/', views.editar_serie, name='editar_serie'),
    path('series/eliminar/<int:pk>/', views.eliminar_serie, name='eliminar_serie'),

    # Autores
    path('autores/', views.listar_autores, name='listar_autores'),
    path('autores/nuevo/', views.crear_autor, name='crear_autor'),
    path('autores/editar/<int:pk>/', views.editar_autor, name='editar_autor'),
    path('autores/eliminar/<int:pk>/', views.eliminar_autor, name='eliminar_autor'),

    # Editoriales
    path('editoriales/', views.listar_editoriales, name='listar_editoriales'),
    path('editoriales/nuevo/', views.crear_editorial, name='crear_editorial'),
    path('editoriales/editar/<int:pk>/', views.editar_editorial, name='editar_editorial'),
    path('editoriales/eliminar/<int:pk>/', views.eliminar_editorial, name='eliminar_editorial'),

    # Demografías
    path('demografias/', views.listar_demografias, name='listar_demografias'),
    path('demografias/nuevo/', views.crear_demografia, name='crear_demografia'),
    path('demografias/editar/<int:pk>/', views.editar_demografia, name='editar_demografia'),
    path('demografias/eliminar/<int:pk>/', views.eliminar_demografia, name='eliminar_demografia'),
]