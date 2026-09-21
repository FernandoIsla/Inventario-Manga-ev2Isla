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


# ==========================================
# FORMULARIOS DE AUTENTICACIÓN Y REGISTRO
# ==========================================
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm

class RegistroUsuarioForm(UserCreationForm):
    first_name = forms.CharField(
        max_length=50,
        required=True,
        label="Nombre",
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Tu nombre'})
    )
    last_name = forms.CharField(
        max_length=50,
        required=True,
        label="Apellido",
        widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Tu apellido'})
    )
    email = forms.EmailField(
        required=True,
        label="Correo Electrónico",
        widget=forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'ejemplo@correo.com'})
    )

    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'email']
        labels = {
            'username': 'Nombre de Usuario',
        }
        widgets = {
            'username': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Elige un nombre de usuario'}),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        if 'password1' in self.fields:
            self.fields['password1'].label = 'Contraseña'
            self.fields['password1'].help_text = ''
            self.fields['password1'].widget.attrs.update({
                'class': 'form-control',
                'placeholder': 'Contraseña segura'
            })
        if 'password2' in self.fields:
            self.fields['password2'].label = 'Confirmar Contraseña'
            self.fields['password2'].help_text = ''
            self.fields['password2'].widget.attrs.update({
                'class': 'form-control',
                'placeholder': 'Repite tu contraseña'
            })
        self.error_messages['password_mismatch'] = 'Las contraseñas ingresadas no coinciden.'


class LoginForm(AuthenticationForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['username'].widget.attrs.update({
            'class': 'form-control',
            'placeholder': 'Nombre de usuario'
        })
        self.fields['password'].widget.attrs.update({
            'class': 'form-control',
            'placeholder': 'Contraseña'
        })