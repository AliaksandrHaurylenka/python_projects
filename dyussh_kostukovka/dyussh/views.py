from django.http import HttpResponse, HttpResponseNotFound, Http404
from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse

from dyussh.models import News, NewsSportType, MainMenu, TagNews


# def sport_type():
#     menu_sports_section = NewsSportType.objects.all()
#     data = {
#         'menu_sports_section': menu_sports_section,
#     }
#     return data


def index(request):
    main_menu = MainMenu.objects.all()
    news_sidebar = News.published.all()
    menu_sports_section = NewsSportType.objects.all()
    data = {
        'title': 'Дюсш-Костюковка',
        'menu': main_menu,
        'menu_sports_section': menu_sports_section,
        'news_sidebar': news_sidebar,  # sidebar
    }
    # sport_type()
    return render(request, 'dyussh/index.html', context=data)


def news(request):
    main_menu = MainMenu.objects.all()
    all_news = News.published.all()
    menu_sports_section = NewsSportType.objects.all()
    data = {
        'title': 'Спортивные события',
        'menu': main_menu,
        'menu_sports_section': menu_sports_section,
        'news': all_news,
        'news_sidebar': all_news,
        'menu_selected': 'news',
    }
    return render(request, 'dyussh/news.html', context=data)


def ads(request):
    main_menu = MainMenu.objects.all()
    news_sidebar = News.published.all()
    menu_sports_section = NewsSportType.objects.all()
    data = {
        'title': 'Объявления Дюсш-Костюковка',
        'menu': main_menu,
        'menu_sports_section': menu_sports_section,
        'news_sidebar': news_sidebar,  # sidebar
        'menu_selected': 'ads',
    }
    return render(request, 'dyussh/ads.html', context=data)


def history(request):
    main_menu = MainMenu.objects.all()
    news_sidebar = News.published.all()
    menu_sports_section = NewsSportType.objects.all()
    data = {
        'title': 'История Дюсш-Костюковка',
        'menu': main_menu,
        'menu_sports_section': menu_sports_section,
        'news_sidebar': news_sidebar,  # sidebar
        'menu_selected': 'history',
    }
    return render(request, 'dyussh/history.html', context=data)


def contacts(request):
    main_menu = MainMenu.objects.all()
    news_sidebar = News.published.all()
    menu_sports_section = NewsSportType.objects.all()
    data = {
        'title': 'Контакты Дюсш-Костюковка',
        'menu': main_menu,
        'menu_sports_section': menu_sports_section,
        'news_sidebar': news_sidebar,  # sidebar
        'menu_selected': 'contacts',
    }
    return render(request, 'dyussh/contacts.html', context=data)


def show_category(request, news_cat_slug):
    category = get_object_or_404(NewsSportType, slug=news_cat_slug)
    all_news = News.published.filter(news_sport_type_id=category.pk)
    news_sidebar = News.published.all()
    data = {
        'title': f'Рубрика: {category.name}',
        'news': all_news,  # sidebar
        'cat_selected': category.pk,
        'news_sidebar': news_sidebar,
        "menu_selected": 'news',
    }

    return render(request, 'dyussh/news.html', context=data)


def show_news(request, news_slug):
    main_menu = MainMenu.objects.all()
    news_sidebar = News.published.all()
    menu_sports_section = NewsSportType.objects.all()
    one_news = get_object_or_404(News, slug=news_slug)

    data = {
        'title': one_news,
        'menu': main_menu,
        'menu_sports_section': menu_sports_section,
        'news_sidebar': news_sidebar,  # sidebar
        'one_news': one_news,
        "menu_selected": 'news',
        'cat_selected': one_news.news_sport_type_id,
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


def show_tag_news_list(request, tag_slug):
    main_menu = MainMenu.objects.all()
    tag = get_object_or_404(TagNews, slug=tag_slug)
    news_tags = tag.tags.filter(is_published=News.Status.PUBLISHED)
    news_sidebar = News.published.all()
    data = {
        'title': f'Тег: {tag.tag}',
        'menu': main_menu,
        "menu_selected": 'news',
        'news': news_tags,
        'news_sidebar': news_sidebar,  # sidebar
        'tag_selected': tag_slug,
    }

    return render(request, 'dyussh/news.html', context=data)

