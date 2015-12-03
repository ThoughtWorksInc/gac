from unittest.mock import Mock, MagicMock
from django.test import TestCase

from allauth.exceptions import ImmediateHttpResponse

from core.auth import GacSocialAccountAdapter


class GacSocialAccountAdapterTestCase(TestCase):
    def setUp(self):
        self.adapter = GacSocialAccountAdapter()
        self.mock_user = Mock()
        self.mock_sociallogin = Mock()
        self.mock_sociallogin.user = self.mock_user

    def test_should_not_accept_thoughtowkrs_email_on_pre_login(self):
        self.mock_user.email = 'test@gmail.com'
        with self.assertRaises(ImmediateHttpResponse):
            self.adapter.pre_social_login(None, self.mock_sociallogin)

    def test_should_accept_thoughtowkrs_email_on_pre_login(self):
        self.mock_user.email = 'test@thoughtworks.com'
        try:
            self.adapter.pre_social_login(None, self.mock_sociallogin)
        except ImmediateHttpResponse as e:
            self.fail('ImmediateHttpResponse must not be raised.')
