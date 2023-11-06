from django.db import models
from django.urls import reverse


class MainMenu(models.Model):
    title = models.CharField(max_length=20)
    slug = models.SlugField(max_length=20, unique=True, db_index=True)

    def __str__(self):
        return self.title


class PublishedModel(models.Manager):
    def get_queryset(self):
        return super().get_queryset().filter(is_published=News.Status.PUBLISHED)


class News(models.Model):
    class Status(models.IntegerChoices):
        DRAFT = 0, 'Черновик'
        PUBLISHED = 1, 'Опубликовано'

    title = models.CharField(max_length=100)
    slug = models.SlugField(max_length=255, unique=True, db_index=True, verbose_name="URL")
    # slug = models.SlugField(max_length=255, db_index=True, blank=True, default='')
    content = models.TextField(blank=True)
    time_create = models.DateTimeField(auto_now_add=True)
    time_update = models.DateTimeField(auto_now=True)
    is_published = models.BooleanField(choices=Status.choices, default=Status.DRAFT)
    news_sport_type = models.ForeignKey('NewsSportType', on_delete=models.PROTECT)
    # Новость связанная с видом спорта

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
        return reverse('show_news', kwargs={'news_slug': self.slug})

    def get_absolute_url_category(self):
        return reverse('news_cat', kwargs={'news_cat_slug': self.news_sport_type.slug})


class NewsSportType(models.Model):
    name = models.CharField(max_length=50)
    slug = models.SlugField(max_length=50, unique=True, db_index=True)

    def get_absolute_url(self):
        return reverse('news_cat', kwargs={'news_cat_slug': self.slug})

    def __str__(self):
        return self.name
