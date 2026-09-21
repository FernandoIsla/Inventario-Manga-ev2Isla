from functools import wraps
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.contrib.auth import login as auth_login, logout as auth_logout
from .models import Tomo, Serie, Autor, Editorial, Demografia
from .forms import (
    TomoForm, SerieForm, AutorForm, EditorialForm, DemografiaForm,
    RegistroUsuarioForm, LoginForm
)

# Decorador para limitar acciones solo a usuarios con rol Administrador
def solo_admin(view_func):
    @wraps(view_func)
    def _wrapped_view(request, *args, **kwargs):
        if not request.user.is_authenticated:
            messages.warning(request, 'Debes iniciar sesión para realizar esta acción.')
            return redirect(f"/login/?next={request.path}")
        if not request.user.is_staff and not request.user.is_superuser:
            messages.error(request, 'Acceso denegado: Se requieren permisos de Administrador para realizar esta acción.')
            return redirect('inicio')
        return view_func(request, *args, **kwargs)
    return _wrapped_view

# 1. Página inicial (muestra resumen y destacados)
def pagina_inicio(request):
    total_tomos = Tomo.objects.count()
    total_series = Serie.objects.count()
    ultimos_tomos = Tomo.objects.select_related('serie', 'editorial').order_by('-id')[:4]
    
    return render(request, 'inicio.html', {
        'total_tomos': total_tomos,
        'total_series': total_series,
        'ultimos_tomos': ultimos_tomos,
    })

# 2. Leer / Listar: Muestra la tabla con los datos y archivos subidos
def listar_tomos(request):
    tomos = Tomo.objects.select_related('serie', 'editorial').all()
    return render(request, 'tomos/listar.html', {'tomos': tomos})

# 3. Crear Tomo: Procesa el formulario con el archivo adjunto
@solo_admin
def crear_tomo(request):
    if request.method == 'POST':
        # request.FILES es indispensable para recibir la imagen o archivo
        form = TomoForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            messages.success(request, 'Tomo agregado exitosamente al inventario.')
            return redirect('listar_tomos')
    else:
        form = TomoForm()
    return render(request, 'tomos/formulario.html', {'form': form, 'titulo': 'Agregar Nuevo Tomo'})

# 4. Actualizar / Editar Tomo
@solo_admin
def editar_tomo(request, pk):
    tomo = get_object_or_404(Tomo, pk=pk)
    if request.method == 'POST':
        form = TomoForm(request.POST, request.FILES, instance=tomo)
        if form.is_valid():
            form.save()
            messages.success(request, 'Tomo actualizado correctamente.')
            return redirect('listar_tomos')
    else:
        form = TomoForm(instance=tomo)
    return render(request, 'tomos/formulario.html', {'form': form, 'titulo': f'Editar Tomo #{tomo.numero_tomo} - {tomo.serie.titulo}'})

# 5. Eliminar Tomo
@solo_admin
def eliminar_tomo(request, pk):
    tomo = get_object_or_404(Tomo, pk=pk)
    if request.method == 'POST':
        tomo.delete()
        messages.success(request, 'Tomo eliminado del inventario.')
        return redirect('listar_tomos')
    return render(request, 'tomos/confirmar_eliminar.html', {'tomo': tomo})


# ==========================================
# CRUD: SERIE
# ==========================================
def listar_series(request):
    series = Serie.objects.select_related('demografia', 'autor').all()
    return render(request, 'series/listar.html', {'series': series})

@solo_admin
def crear_serie(request):
    if request.method == 'POST':
        form = SerieForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Serie creada exitosamente.')
            return redirect('listar_series')
    else:
        form = SerieForm()
    return render(request, 'series/formulario.html', {'form': form, 'titulo': 'Agregar Nueva Serie'})

@solo_admin
def editar_serie(request, pk):
    serie = get_object_or_404(Serie, pk=pk)
    if request.method == 'POST':
        form = SerieForm(request.POST, instance=serie)
        if form.is_valid():
            form.save()
            messages.success(request, 'Serie actualizada correctamente.')
            return redirect('listar_series')
    else:
        form = SerieForm(instance=serie)
    return render(request, 'series/formulario.html', {'form': form, 'titulo': f'Editar Serie: {serie.titulo}'})

@solo_admin
def eliminar_serie(request, pk):
    serie = get_object_or_404(Serie, pk=pk)
    if request.method == 'POST':
        serie.delete()
        messages.success(request, 'Serie eliminada correctamente.')
        return redirect('listar_series')
    return render(request, 'series/confirmar_eliminar.html', {'serie': serie})


# ==========================================
# CRUD: AUTOR
# ==========================================
def listar_autores(request):
    autores = Autor.objects.all()
    return render(request, 'autores/listar.html', {'autores': autores})

@solo_admin
def crear_autor(request):
    if request.method == 'POST':
        form = AutorForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Autor agregado exitosamente.')
            return redirect('listar_autores')
    else:
        form = AutorForm()
    return render(request, 'autores/formulario.html', {'form': form, 'titulo': 'Agregar Nuevo Autor'})

@solo_admin
def editar_autor(request, pk):
    autor = get_object_or_404(Autor, pk=pk)
    if request.method == 'POST':
        form = AutorForm(request.POST, instance=autor)
        if form.is_valid():
            form.save()
            messages.success(request, 'Autor actualizado correctamente.')
            return redirect('listar_autores')
    else:
        form = AutorForm(instance=autor)
    return render(request, 'autores/formulario.html', {'form': form, 'titulo': f'Editar Autor: {autor.nombre}'})

@solo_admin
def eliminar_autor(request, pk):
    autor = get_object_or_404(Autor, pk=pk)
    if request.method == 'POST':
        autor.delete()
        messages.success(request, 'Autor eliminado correctamente.')
        return redirect('listar_autores')
    return render(request, 'autores/confirmar_eliminar.html', {'autor': autor})


# ==========================================
# CRUD: EDITORIAL
# ==========================================
def listar_editoriales(request):
    editoriales = Editorial.objects.all()
    return render(request, 'editoriales/listar.html', {'editoriales': editoriales})

@solo_admin
def crear_editorial(request):
    if request.method == 'POST':
        form = EditorialForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Editorial agregada exitosamente.')
            return redirect('listar_editoriales')
    else:
        form = EditorialForm()
    return render(request, 'editoriales/formulario.html', {'form': form, 'titulo': 'Agregar Nueva Editorial'})

@solo_admin
def editar_editorial(request, pk):
    editorial = get_object_or_404(Editorial, pk=pk)
    if request.method == 'POST':
        form = EditorialForm(request.POST, instance=editorial)
        if form.is_valid():
            form.save()
            messages.success(request, 'Editorial actualizada correctamente.')
            return redirect('listar_editoriales')
    else:
        form = EditorialForm(instance=editorial)
    return render(request, 'editoriales/formulario.html', {'form': form, 'titulo': f'Editar Editorial: {editorial.nombre}'})

@solo_admin
def eliminar_editorial(request, pk):
    editorial = get_object_or_404(Editorial, pk=pk)
    if request.method == 'POST':
        editorial.delete()
        messages.success(request, 'Editorial eliminada correctamente.')
        return redirect('listar_editoriales')
    return render(request, 'editoriales/confirmar_eliminar.html', {'editorial': editorial})


# ==========================================
# CRUD: DEMOGRAFIA
# ==========================================
def listar_demografias(request):
    demografias = Demografia.objects.all()
    return render(request, 'demografias/listar.html', {'demografias': demografias})

@solo_admin
def crear_demografia(request):
    if request.method == 'POST':
        form = DemografiaForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Demografía agregada exitosamente.')
            return redirect('listar_demografias')
    else:
        form = DemografiaForm()
    return render(request, 'demografias/formulario.html', {'form': form, 'titulo': 'Agregar Nueva Demografía'})

@solo_admin
def editar_demografia(request, pk):
    demografia = get_object_or_404(Demografia, pk=pk)
    if request.method == 'POST':
        form = DemografiaForm(request.POST, instance=demografia)
        if form.is_valid():
            form.save()
            messages.success(request, 'Demografía actualizada correctamente.')
            return redirect('listar_demografias')
    else:
        form = DemografiaForm(instance=demografia)
    return render(request, 'demografias/formulario.html', {'form': form, 'titulo': f'Editar Demografía: {demografia.nombre}'})

@solo_admin
def eliminar_demografia(request, pk):
    demografia = get_object_or_404(Demografia, pk=pk)
    if request.method == 'POST':
        demografia.delete()
        messages.success(request, 'Demografía eliminada correctamente.')
        return redirect('listar_demografias')
    return render(request, 'demografias/confirmar_eliminar.html', {'demografia': demografia})


# ==========================================
# AUTENTICACIÓN Y CONTROL DE ACCESO
# ==========================================
def iniciar_sesion(request):
    if request.user.is_authenticated:
        return redirect('inicio')
    
    if request.method == 'POST':
        form = LoginForm(request, data=request.POST)
        if form.is_valid():
            user = form.get_user()
            auth_login(request, user)
            rol = "Administrador" if (user.is_staff or user.is_superuser) else "Operador"
            messages.success(request, f'Sesión iniciada como {user.username} ({rol}).')
            next_url = request.GET.get('next') or 'inicio'
            return redirect(next_url)
        else:
            messages.error(request, 'Usuario o contraseña incorrectos. Por favor intenta de nuevo.')
    else:
        form = LoginForm()
    
    return render(request, 'auth/login.html', {'form': form})

def cerrar_sesion(request):
    if request.user.is_authenticated:
        auth_logout(request)
        messages.info(request, 'Has cerrado sesión exitosamente.')
    return redirect('inicio')

def registro_usuario(request):
    if request.user.is_authenticated:
        return redirect('inicio')
    
    if request.method == 'POST':
        form = RegistroUsuarioForm(request.POST)
        if form.is_valid():
            nuevo_usuario = form.save(commit=False)
            # Todo nuevo usuario registrado inicia como Operador (sin permisos de staff/admin)
            nuevo_usuario.is_staff = False
            nuevo_usuario.is_superuser = False
            nuevo_usuario.save()
            messages.success(
                request,
                f'¡Cuenta creada con éxito para {nuevo_usuario.username}! Ya puedes iniciar sesión con tu usuario.'
            )
            return redirect('login')
    else:
        form = RegistroUsuarioForm()
    
    return render(request, 'auth/registro.html', {'form': form})
