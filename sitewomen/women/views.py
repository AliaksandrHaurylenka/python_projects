from django.http import HttpResponse, HttpResponseNotFound, Http404
from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse

from .models import Women, Category, TagPost

menu = [
    {'title': "О сайте", 'url_name': 'about'},
    {'title': "Добавить статью", 'url_name': 'add_page'},
    {'title': "Обратная связь", 'url_name': 'contact'},
    {'title': "Войти", 'url_name': 'login'}
]


def index(request):
    posts = Women.published.all()

    data = {
        'title': 'Главная страница',
        'menu': menu,
        'posts': posts,
        'cat_selected': 0,
    }
    return render(request, 'women/index.html', context=data)


def about(request):
    return render(request, 'women/about.html', {'title': 'О нас', 'menu': menu})


def show_post(request, post_slug):
    post = get_object_or_404(Women, slug=post_slug)

    data = {
        # 'title': post.title,
        'title': post,
        'menu': menu,
        'post': post,
        # 'cat_selected': 1,
    }

    return render(request, 'women/post.html', context=data)


def addpage(request):
    return HttpResponseNotFound('<h1>Добавить статью</h1>')


def contact(request):
    return HttpResponseNotFound('<h1>Обратная связь</h1>')


def login(request):
    return HttpResponseNotFound('<h1>Авторизация</h1>')


def page_not_found(request, exception):
    return HttpResponseNotFound('<h1>Страница не найдена</h1>')


def show_category(request, cat_slug):
    category = get_object_or_404(Category, slug=cat_slug)
    posts = Women.published.filter(cat_id=category.pk)
    data = {
        'title': f'Рубрика: {category.name}',
        'menu': menu,
        'posts': posts,
        'cat_selected': category.pk,
    }

    return render(request, 'women/index.html', context=data)


def show_tag_postlist(request, tag_slug):
    tag = get_object_or_404(TagPost, slug=tag_slug)
    posts = tag.tags.filter(is_published=Women.Status.PUBLISHED)
    data = {
        'title': f'Тег: {tag.tag}',
        'menu': menu,
        'posts': posts,
        'cat_selected': None,
    }

    return render(request, 'women/index.html', context=data)


