# Generated by Django 4.2.6 on 2023-12-05 07:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('women', '0008_alter_women_cat'),
    ]

    operations = [
        migrations.AddField(
            model_name='husband',
            name='m_count',
            field=models.IntegerField(blank=True, default=0),
        ),
    ]
