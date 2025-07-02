import os
from pathlib import Path
from dotenv import load_dotenv
from corsheaders.defaults import default_headers

# ------------------------------------------------------------------------------
# Load Environment Variables
# ------------------------------------------------------------------------------
BASE_DIR = Path(__file__).resolve().parent.parent
load_dotenv(dotenv_path=BASE_DIR.parent / '.env')

# ------------------------------------------------------------------------------
# Core Settings
# ------------------------------------------------------------------------------
DEBUG = os.getenv('DEBUG', 'False').lower() in ('true', '1', 'yes')
SECRET_KEY = os.getenv('DJANGO_SECRET_KEY', 'insecure-secret-key-for-dev')
HOST_URL = os.getenv('HOST_URL', 'http://127.0.0.1:8000')

ALLOWED_HOSTS = os.getenv('DJANGO_ALLOWED_HOSTS', '127.0.0.1,localhost').split(',')

# ------------------------------------------------------------------------------
# CORS & CSRF
# ------------------------------------------------------------------------------
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CORS_ALLOW_HEADERS = list(default_headers)

CSRF_TRUSTED_ORIGINS = [
    "http://127.0.0.1:8000",
    HOST_URL
]

X_FRAME_OPTIONS = 'DENY'

# ------------------------------------------------------------------------------
# Installed Apps
# ------------------------------------------------------------------------------
INSTALLED_APPS = [
    'jazzmin',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.humanize',
    'django.contrib.sites',
    'corsheaders',
    'homeapp',
]

SITE_ID = 1

# ------------------------------------------------------------------------------
# Middleware
# ------------------------------------------------------------------------------
MIDDLEWARE = [
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

APPEND_SLASH = True
ROOT_URLCONF = 'library.urls'

# ------------------------------------------------------------------------------
# Templates
# ------------------------------------------------------------------------------
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [BASE_DIR / 'templates'],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
            'builtins': ['heroicons.templatetags.heroicons'],
        },
    },
]

# ------------------------------------------------------------------------------
# Authentication
# ------------------------------------------------------------------------------
AUTH_USER_MODEL = 'homeapp.User'
AUTHENTICATION_BACKENDS = ['django.contrib.auth.backends.ModelBackend']
WSGI_APPLICATION = 'library.wsgi.application'

# ------------------------------------------------------------------------------
# Database
# ------------------------------------------------------------------------------
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': os.getenv('DATABASE_NAME', 'library'),
        'USER': os.getenv('DATABASE_USER', 'root'),
        'PASSWORD': os.getenv('DATABASE_PASSWORD', 'root'),
        'HOST': os.getenv('DATABASE_HOST', 'localhost'),
        'PORT': os.getenv('DATABASE_PORT', '3306'),
        'OPTIONS': {
            'connect_timeout': 10,
        },
    }
}

# ------------------------------------------------------------------------------
# Password Validation
# ------------------------------------------------------------------------------
AUTH_PASSWORD_VALIDATORS = [
    {'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator'},
    {'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator'},
    {'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator'},
    {'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator'},
]

# ------------------------------------------------------------------------------
# Localization
# ------------------------------------------------------------------------------
LANGUAGE_CODE = 'en-us'
TIME_ZONE = 'Asia/Kuala_Lumpur'
USE_I18N = True
USE_TZ = True

# ------------------------------------------------------------------------------
# Static and Media Files
# ------------------------------------------------------------------------------
STATIC_URL = '/static/'
STATIC_ROOT = BASE_DIR / 'static'

STATICFILES_DIRS = [
    BASE_DIR / 'assets',
]

MEDIA_URL = '/media/'
MEDIA_ROOT = os.getenv('MEDIA_ROOT', BASE_DIR.parent / 'media')

# ------------------------------------------------------------------------------
# Primary Key
# ------------------------------------------------------------------------------
DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

# ------------------------------------------------------------------------------
# Crispy Forms (optional)
# ------------------------------------------------------------------------------
CRISPY_ALLOWED_TEMPLATE_PACKS = ("tailwind",)
CRISPY_TEMPLATE_PACK = "tailwind"

# ------------------------------------------------------------------------------
# Logging
# ------------------------------------------------------------------------------
LOGGING = {
    "version": 1,
    "disable_existing_loggers": False,
    "formatters": {
        "verbose": {
            "format": "[{asctime}] {levelname} {name}: {message}",
            "style": "{",
        },
    },
    "handlers": {
        "console": {
            "class": "logging.StreamHandler",
            "formatter": "verbose",
        },
    },
    "root": {
        "handlers": ["console"],
        "level": "INFO",
    },
}

# ------------------------------------------------------------------------------
# Jazzmin Admin Theme
# ------------------------------------------------------------------------------
JAZZMIN_SETTINGS = {
    "site_title": "University Library",
    "site_header": "University Library Admin",
    "site_brand": "Library",
    "site_logo": "logo.png",
    "login_logo": "logo.png",
    "login_logo_dark": "logo.png",
    "site_icon": "favicon.ico",
    "welcome_sign": "Welcome to the Library Admin Portal",
    "site_user_avatar": "img-circle",
    "login_form_class": "bg-white p-8 rounded-xl shadow-lg",
    "dark_mode_theme": "darkly",
    "custom_css": "admin.css",

    # Optional model icons
    "icons": {
        "homeapp.User": "fas fa-user",
        "homeapp.StudentProfile": "fas fa-id-card",
        "homeapp.Book": "fas fa-book",
        "homeapp.Course": "fas fa-graduation-cap",
        "homeapp.BorrowRecord": "fas fa-history",
    },
}
