from django.db import models

class Demografia(models.Model):
    nombre = models.CharField(max_length=50, unique=True, verbose_name="Nombre")
    descripcion = models.TextField(blank=True, null=True, verbose_name="Descripción")

    def __str__(self):
        return self.nombre

class Autor(models.Model):
    nombre = models.CharField(max_length=100, verbose_name="Nombre Completo")
    nacionalidad = models.CharField(max_length=50, blank=True, null=True, verbose_name="Nacionalidad")

    def __str__(self):
        return self.nombre

class Editorial(models.Model):
    nombre = models.CharField(max_length=100, unique=True, verbose_name="Nombre Editorial")
    pais_origen = models.CharField(max_length=50, blank=True, null=True, verbose_name="País de Origen")

    def __str__(self):
        return self.nombre

class Serie(models.Model):
    ESTADOS = [
        ('EN_CURSO', 'En curso'),
        ('FINALIZADO', 'Finalizado'),
        ('PAUSA', 'En pausa'),
    ]

    titulo = models.CharField(max_length=150, verbose_name="Título")
    sinopsis = models.TextField(blank=True, null=True, verbose_name="Sinopsis")
    estado = models.CharField(max_length=20, choices=ESTADOS, default='EN_CURSO', verbose_name="Estado")
    demografia = models.ForeignKey(Demografia, on_delete=models.CASCADE, related_name='series', verbose_name="Demografía")
    autor = models.ForeignKey(Autor, on_delete=models.CASCADE, related_name='series', verbose_name="Autor")
    tomo_portada = models.ForeignKey(
        'Tomo',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name='series_portada',
        verbose_name="Tomo para Portada"
    )

    def get_portada_url(self):
        if self.tomo_portada and self.tomo_portada.archivo_portada:
            try:
                return self.tomo_portada.archivo_portada.url
            except Exception:
                pass
        primer_tomo = self.tomos.filter(archivo_portada__isnull=False).exclude(archivo_portada='').order_by('numero_tomo').first()
        if primer_tomo and primer_tomo.archivo_portada:
            try:
                return primer_tomo.archivo_portada.url
            except Exception:
                pass
        return None

    @property
    def editoriales_nombres(self):
        nombres = list(self.tomos.values_list('editorial__nombre', flat=True).distinct())
        return ", ".join(nombres) if nombres else "Sin editorial"

    def __str__(self):
        return self.titulo

class Tomo(models.Model):
    serie = models.ForeignKey(Serie, on_delete=models.CASCADE, related_name='tomos', verbose_name="Serie")
    editorial = models.ForeignKey(Editorial, on_delete=models.CASCADE, related_name='tomos', verbose_name="Editorial")
    numero_tomo = models.PositiveIntegerField(verbose_name="Número de Tomo")
    isbn = models.CharField(max_length=20, unique=True, verbose_name="ISBN")
    precio = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="Precio")
    stock = models.PositiveIntegerField(default=0, verbose_name="Stock Disponible")
    
    archivo_portada = models.FileField(upload_to='portadas/', verbose_name="Archivo/Portada")
    fecha_ingreso = models.DateField(auto_now_add=True, verbose_name="Fecha de Registro")

    def __str__(self):
        return f"{self.serie.titulo} - Tomo {self.numero_tomo}"