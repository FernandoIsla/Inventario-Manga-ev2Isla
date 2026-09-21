from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from .models import Tomo, Serie
from .forms import TomoForm

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
def eliminar_tomo(request, pk):
    tomo = get_object_or_404(Tomo, pk=pk)
    if request.method == 'POST':
        tomo.delete()
        messages.success(request, 'Tomo eliminado del inventario.')
        return redirect('listar_tomos')
    return render(request, 'tomos/confirmar_eliminar.html', {'tomo': tomo})
