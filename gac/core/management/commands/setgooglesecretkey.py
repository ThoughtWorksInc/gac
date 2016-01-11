from django.core.management.base import BaseCommand
from django.contrib.sites.models import Site

from allauth.socialaccount.models import SocialApp
from decouple import config


class Command(BaseCommand):
    help = 'Insere a chave de autenticação do Google.'

    def handle(self, *args, **kwargs):
        app = SocialApp.objects.create(
            provider='google',
            name='GAC',
            client_id=config('GOOGLE_CLIENT_ID'),
            secret=config('GOOGLE_CLIENT_SECRET'))

        app.sites.add(Site.objects.first())
        app.save()
