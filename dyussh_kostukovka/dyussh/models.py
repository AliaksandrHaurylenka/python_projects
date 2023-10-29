from django.db import models
from django.urls import reverse


class News(models.Model):
    title = models.CharField(max_length=100)
    slug = models.SlugField(max_length=255, unique=True, db_index=True, verbose_name="URL")
    # slug = models.SlugField(max_length=255, db_index=True, blank=True, default='')
    content = models.TextField(blank=True)
    # sport_type = models.IntegerField() # Новость связанная с видом спорта
    time_create = models.DateTimeField(auto_now_add=True)
    time_update = models.DateTimeField(auto_now=True)
    is_published = models.BooleanField(default=False)

    class Meta:
        ordering = ['-time_create']
        indexes = [
            models.Index(fields=['-time_create']),
        ]

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse('show_news', kwargs={'news_slug': self.slug})
