import os
import sys

# Add the root directory of your project to the system path
sys.path.insert(0, os.path.abspath('..'))

# Set the environment variable to the settings module of your Django project
os.environ['DJANGO_SETTINGS_MODULE'] = 'texturGen.settings'

# Extensions to use
extensions = [
    'sphinx.ext.autodoc',
    'sphinx.ext.viewcode',
    'sphinx.ext.napoleon',
]

# Add any additional modules you want to document
autodoc_mock_imports = ['django']

# The master toctree document.
master_doc = 'index'

# General information about the project.
project = 'textureGen'
author = 'Your Name'
version = '0.1'
release = '0.1.0'

# HTML output configuration
html_theme = 'alabaster'
html_static_path = ['_static']
html_sidebars = {
    '**': [
        'about.html',
        'navigation.html',
        'searchbox.html',
    ]
}
