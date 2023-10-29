from django.http import HttpResponse, HttpResponseNotFound, Http404
from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse

from .models import Women

menu = [{'title': "О сайте", 'url_name': 'about'},
        {'title': "Добавить статью", 'url_name': 'add_page'},
        {'title': "Обратная связь", 'url_name': 'contact'},
        {'title': "Войти", 'url_name': 'login'}
        ]

data_db = [
    {'id': 1, 'title': 'Анджелина Джоли', 'content': '''<h1>Анджелина Джоли</h1> (англ. Angelina Jolie[7], 
    при рождении Войт (англ. Voight), ранее Джоли Питт (англ. Jolie Pitt); род. 4 июня 1975, Лос-Анджелес, 
    Калифорния, США) — американская актриса кино, телевидения и озвучивания, кинорежиссёр, сценаристка, продюсер, 
    фотомодель, посол доброй воли ООН. Обладательница премии «Оскар», трёх премий «Золотой глобус» (первая актриса в 
    истории, три года подряд выигравшая премию) и двух «Премий Гильдии киноактёров США».''',
     'is_published': True},
    {'id': 2, 'title': 'Марго Робби', 'content': 'Биография Марго Робби', 'is_published': False},
    {'id': 3, 'title': 'Джулия Робертс', 'content': 'Биография Джулия Робертс', 'is_published': True},
]

cats_db = [
    {'id': 1, 'name': 'Актрисы'},
    {'id': 2, 'name': 'Певицы'},
    {'id': 3, 'name': 'Спортсменки'},
]


def index(request):
    posts = Women.objects.filter(is_published=1)

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
        'cat_selected': 1,
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
        # 'posts': data_db,
        'cat_selected': cat_id,
    }

    return render(request, 'women/index.html', context=data)
