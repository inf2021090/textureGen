from django.urls import path
from django.views.generic import RedirectView
from django.conf.urls import url
from django.views.generic.base import TemplateView

urlpatterns = [
    # ...
    url(r'^streamlit/$', RedirectView.as_view(url="http://localhost:8501/editor")),
]

