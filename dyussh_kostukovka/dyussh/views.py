from django.http import HttpResponse, HttpResponseNotFound, Http404
from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse

from dyussh.models import News

menu = [
    {'id': 1, 'title': "Новости", 'url_name': 'news'},
    {'id': 2, 'title': "Объявления", 'url_name': 'ads'},
    {'id': 3, 'title': "Контакты", 'url_name': 'contacts'},
    {'id': 4, 'title': "История", 'url_name': 'history'},
    # {'title': "Войти", 'url_name': 'login'},
]

menu_sports_section = [
    {'title': "Плавание", 'url_name': 'swimming'},
    {'title': "Борьба", 'url_name': 'wrestling'},
    {'title': "Легкая атлетика", 'url_name': 'athletics'},
    {'title': "Тяжелая атлетика", 'url_name': 'weightlifting'},
    {'title': "Футбол", 'url_name': 'football'},
    {'title': "Волейбол", 'url_name': 'volleyball'},
]

news_cats_db = [
    {'id': 1, 'slug': 'swimming', 'name': 'Плавание'},
    {'id': 2, 'slug': 'wrestling', 'name': 'Борьба'},
    {'id': 3, 'slug': 'athletics', 'name': 'Легкая атлетика'},
    {'id': 4, 'slug': 'weightlifting', 'name': 'Тяжелая атлетика'},
    {'id': 5, 'slug': 'football', 'name': 'Футбол'},
    {'id': 6, 'slug': 'volleyball', 'name': 'Волейбол'},
]


def index(request):
    all_news = News.published.all()
    data = {
        'title': 'Дюсш-Костюковка',
        'menu': menu,
        'menu_sports_section': menu_sports_section,
        'news': all_news,  # sidebar
    }
    return render(request, 'dyussh/index.html', context=data)


def news(request):
    all_news = News.published.all()
    data = {
        'title': 'Спортивные события',
        'menu': menu,
        'menu_sports_section': menu_sports_section,
        'news': all_news,
    }
    return render(request, 'dyussh/news.html', context=data)


def ads(request):
    all_news = News.published.all()
    data = {
        'title': 'Объявления Дюсш-Костюковка',
        'menu': menu,
        'menu_sports_section': menu_sports_section,
        'news': all_news,  # sidebar
    }
    return render(request, 'dyussh/ads.html', context=data)


def history(request):
    all_news = News.published.all()
    data = {
        'title': 'История Дюсш-Костюковка',
        'menu': menu,
        'menu_sports_section': menu_sports_section,
        'news': all_news,  # sidebar
    }
    return render(request, 'dyussh/history.html', context=data)


def contacts(request):
    all_news = News.published.all()
    data = {
        'title': 'Контакты Дюсш-Костюковка',
        'menu': menu,
        'menu_sports_section': menu_sports_section,
        'news': all_news,  # sidebar
    }
    return render(request, 'dyussh/contacts.html', context=data)


def news_cat_slug(request, cat_id, news_cat):
    data = {
        'title': 'Новости по категориям',
        'menu': menu,
        # 'posts': data_db,
        'cat_selected': cat_id,
        'news_cat': news_cat,
    }

    return render(request, 'dyussh/index.html', context=data)


def show_news(request, news_slug):
    all_news = News.published.all()
    one_news = get_object_or_404(News, slug=news_slug)
    data = {
        # 'title': post.title,
        'title': one_news,
        'menu': menu,
        'menu_sports_section': menu_sports_section,
        'news': all_news,  # sidebar
        'one_news': one_news,
        'cat_selected': 1,
    }

    return render(request, 'dyussh/one_news.html', context=data)


def login(request):
    return HttpResponse(f'<h1>Авторизация</h1')


def archive(request, year):
    if year > 2023:
        url_redirect = reverse('news_cat', args=('swimming',))
        return redirect(url_redirect)
    return HttpResponse(f'<h1>"Спорт-Костюковка" - архив по годам</h1><p>year: {year}</p>')


def page_not_found(request, exception):
    return HttpResponseNotFound('<h1>Страница не найдена</h1>')


def swimming(request):
    return HttpResponse(f'<h1>Плавание</h1')


def wrestling(request):
    return HttpResponse(f'<h1>Борьба</h1')


def athletics(request):
    return HttpResponse(f'<h1>Легкая атлетика</h1')


def weightlifting(request):
    return HttpResponse(f'<h1>Тяжелая атлетика</h1')


def football(request):
    return HttpResponse(f'<h1>Футбол</h1')


def volleyball(request):
    return HttpResponse(f'<h1>Волейбол</h1')
