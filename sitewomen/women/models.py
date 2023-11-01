from django.db import models
from django.urls import reverse


class PublishedModel(models.Manager):
    def get_queryset(self):
        return super().get_queryset().filter(is_published=Women.Status.PUBLISHED)


class Women(models.Model):
    class Status(models.IntegerChoices):
        DRAFT = 0, 'Черновик'
        PUBLISHED = 1, 'Опубликовано'

    title = models.CharField(max_length=255)
    slug = models.SlugField(max_length=255, unique=True, db_index=True, verbose_name="URL")
    # slug = models.SlugField(max_length=255, db_index=True, blank=True, default='')
    # добавление поля, когда таблица уже существует
    content = models.TextField(blank=True)
    time_create = models.DateTimeField(auto_now_add=True)
    time_update = models.DateTimeField(auto_now=True)
    is_published = models.BooleanField(choices=Status.choices, default=Status.DRAFT)
    # cat = models.ForeignKey('Category', on_delete=models.PROTECT, null=True)
    # можно поле оставить с пустым значением
    cat = models.ForeignKey('Category', on_delete=models.PROTECT)

    objects = models.Manager()
    published = PublishedModel()

    class Meta:
        ordering = ['-time_create']
        indexes = [
            models.Index(fields=['-time_create']),
        ]

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse('post', kwargs={'post_slug': self.slug})


class Category(models.Model):
    name = models.CharField(max_length=100)
    slug = models.SlugField(max_length=255, unique=True, db_index=True)

    def __str__(self):
        return self.name
