from django.http import HttpResponse, HttpResponseNotFound, Http404
from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse

from .models import Women

menu = [
    {'title': "О сайте", 'url_name': 'about'},
    {'title': "Добавить статью", 'url_name': 'add_page'},
    {'title': "Обратная связь", 'url_name': 'contact'},
    {'title': "Войти", 'url_name': 'login'}
]


cats_db = [
    {'id': 1, 'name': 'Актрисы'},
    {'id': 2, 'name': 'Певицы'},
    {'id': 3, 'name': 'Спортсменки'},
]


def index(request):
    posts = Women.published.all()

    data = {
        'title': 'Главная страница',
        'menu': menu,
        'posts': posts,
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


def show_category(request, cat_id):
    data = {
        'title': 'Отображение по рубрикам',
        'menu': menu,
        'posts': Women.published.all(),
        'cat_selected': cat_id,
    }

    return render(request, 'women/index.html', context=data)
