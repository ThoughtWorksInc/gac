from allauth.exceptions import ImmediateHttpResponse
from allauth.socialaccount.adapter import DefaultSocialAccountAdapter


class GacSocialAccountAdapter(DefaultSocialAccountAdapter):
    def pre_social_login(self, request, sociallogin):
        allowed_email_domains = ('thoughtworks.com')
        user_email = sociallogin.user.email
        email_domain = user_email.split('@')[-1] if user_email else ''
        if email_domain not in allowed_email_domains:
            raise ImmediateHttpResponse(None)
