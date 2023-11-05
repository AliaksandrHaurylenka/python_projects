from django import template
import dyussh.views as views
from dyussh.models import NewsSportType, MainMenu

register = template.Library()


@register.inclusion_tag('dyussh/inclusions-tags/main_menu.html')
def main_menu(menu_selected=''):
    menu = MainMenu.objects.all()
    return {"main_menu": menu, "menu_selected": menu_selected}


@register.inclusion_tag('dyussh/inclusions-tags/list_news_categories.html')
def show_news_categories(cat_selected_id=0):
    cats = NewsSportType.objects.all()
    return {"cats": cats, "cat_selected": cat_selected_id}
