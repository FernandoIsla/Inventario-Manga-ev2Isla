from django import forms
from .models import Demografia, Autor, Editorial, Serie, Tomo

# Formulario para Tomo (incluye subida de archivo)
class TomoForm(forms.ModelForm):
    class Meta:
        model = Tomo
        fields = ['serie', 'editorial', 'numero_tomo', 'isbn', 'precio', 'stock', 'archivo_portada']
        # Los widgets permiten agregar clases CSS para estilizar con Stitch/Tailwind o Bootstrap
        widgets = {
            'serie': forms.Select(attrs={'class': 'form-select'}),
            'editorial': forms.Select(attrs={'class': 'form-select'}),
            'numero_tomo': forms.NumberInput(attrs={'class': 'form-control', 'min': '1'}),
            'isbn': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Ej: 978-84-123456-7-8'}),
            'precio': forms.NumberInput(attrs={'class': 'form-control', 'step': '0.01'}),
            'stock': forms.NumberInput(attrs={'class': 'form-control', 'min': '0'}),
            'archivo_portada': forms.ClearableFileInput(attrs={'class': 'form-control'}),
        }

# Formularios para los otros modelos auxiliares
class SerieForm(forms.ModelForm):
    class Meta:
        model = Serie
        fields = ['titulo', 'sinopsis', 'estado', 'demografia', 'autor']
        widgets = {
            'titulo': forms.TextInput(attrs={'class': 'form-control'}),
            'sinopsis': forms.Textarea(attrs={'class': 'form-control', 'rows': 3}),
            'estado': forms.Select(attrs={'class': 'form-select'}),
            'demografia': forms.Select(attrs={'class': 'form-select'}),
            'autor': forms.Select(attrs={'class': 'form-select'}),
        }

class AutorForm(forms.ModelForm):
    class Meta:
        model = Autor
        fields = ['nombre', 'nacionalidad']
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control'}),
            'nacionalidad': forms.TextInput(attrs={'class': 'form-control'}),
        }

class EditorialForm(forms.ModelForm):
    class Meta:
        model = Editorial
        fields = ['nombre', 'pais_origen']
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control'}),
            'pais_origen': forms.TextInput(attrs={'class': 'form-control'}),
        }

class DemografiaForm(forms.ModelForm):
    class Meta:
        model = Demografia
        fields = ['nombre', 'descripcion']
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control'}),
            'descripcion': forms.Textarea(attrs={'class': 'form-control', 'rows': 2}),
        }