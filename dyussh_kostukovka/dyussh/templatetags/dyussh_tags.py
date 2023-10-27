from django import template
import dyussh.views as views

register = template.Library()


@register.inclusion_tag('dyussh/inclusions-tags/list_news_categories.html')
def show_news_categories(cat_selected=0):
    cats = views.news_cats_db
    return {"cats": cats, "cat_selected": cat_selected}
