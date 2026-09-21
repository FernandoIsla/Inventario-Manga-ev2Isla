from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from .models import Demografia, Autor, Editorial, Serie, Tomo

class TomoForm(forms.ModelForm):
    class Meta:
        model = Tomo
        fields = ['serie', 'editorial', 'numero_tomo', 'isbn', 'precio', 'stock', 'archivo_portada']
        widgets = {
            'serie': forms.Select(attrs={'class': 'form-select'}),
            'editorial': forms.Select(attrs={'class': 'form-select'}),
            'numero_tomo': forms.NumberInput(attrs={'class': 'form-control', 'min': '1', 'placeholder': 'Ej: 1'}),
            'isbn': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Ej: 978-84-123456-7-8'}),
            'precio': forms.NumberInput(attrs={'class': 'form-control', 'step': '1', 'placeholder': 'Ej: 11990'}),
            'stock': forms.NumberInput(attrs={'class': 'form-control', 'min': '0', 'placeholder': 'Ej: 10'}),
            'archivo_portada': forms.FileInput(attrs={'class': 'upload-input', 'id': 'id_archivo_portada', 'accept': 'image/*,.pdf'}),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        if not self.instance.pk:
            self.fields['stock'].initial = None

class SerieForm(forms.ModelForm):
    class Meta:
        model = Serie
        fields = ['titulo', 'sinopsis', 'estado', 'demografia', 'autor', 'tomo_portada']
        widgets = {
            'titulo': forms.TextInput(attrs={'class': 'form-control'}),
            'sinopsis': forms.Textarea(attrs={'class': 'form-control', 'rows': 3}),
            'estado': forms.Select(attrs={'class': 'form-select'}),
            'demografia': forms.Select(attrs={'class': 'form-select'}),
            'autor': forms.Select(attrs={'class': 'form-select'}),
            'tomo_portada': forms.Select(attrs={'class': 'form-select'}),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        if self.instance and self.instance.pk:
            self.fields['tomo_portada'].queryset = Tomo.objects.filter(serie=self.instance).order_by('numero_tomo')
            self.fields['tomo_portada'].empty_label = "Automático (Usar portada de Tomo #1)"
            self.fields['tomo_portada'].required = False
            self.fields['tomo_portada'].label = "Tomo para Portada (Destacada en Inicio)"
        else:
            self.fields['tomo_portada'].widget = forms.HiddenInput()
            self.fields['tomo_portada'].required = False

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