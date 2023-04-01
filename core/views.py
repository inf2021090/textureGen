from django.shortcuts import render

def streamlit_view(request):
    return render(request, 'streamlit.html')

