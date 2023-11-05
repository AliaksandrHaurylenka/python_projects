from django.urls import path, register_converter
from dyussh import views, converters

register_converter(converters.FourDigitYearConverter, "year4")

urlpatterns = [
    path('', views.index, name='home'),
    path('news/', views.news, name='news'),
    path('news/<slug:news_cat_slug>', views.show_category, name='news_cat'),
    path('news/show-news/<slug:news_slug>', views.show_news, name='show_news'),
    path('ads/', views.ads, name='ads'),
    path('contacts/', views.contacts, name='contacts'),
    path('history/', views.history, name='history'),
    path('login/', views.login, name='login'),

    path('swimming/', views.swimming, name='swimming'),
    path('wrestling/', views.wrestling, name='wrestling'),
    path('athletics/', views.athletics, name='athletics'),
    path('weightlifting/', views.weightlifting, name='weightlifting'),
    path('football/', views.football, name='football'),
    path('volleyball/', views.volleyball, name='volleyball'),

    path('archive/<year4:year>/', views.archive, name='archive'),
]
