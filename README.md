# 📚 University Library Management System

A modern, scalable, and beautiful library management system for universities. Built with Django, Jazzmin, MySQL, and Tailwind CSS.

![Library Dashboard Screenshot](assets/img/preview.png)

---

## 🚀 Features

- 🧑‍🎓 Custom Student Profiles with Matric Number & Course
- 📖 Book Inventory with Availability Tracking
- 🧾 Borrow/Return Tracking via Smart Records
- 🔐 Secure Custom User Authentication
- 🎨 Beautiful Admin Panel via Jazzmin
- 🌐 CORS-enabled API-ready Backend
- 🖼 Heroicons and Tailwind Support
- 🗃 MySQL Database Support (production ready)

---

## 🛠 Tech Stack

| Layer         | Technology               |
|---------------|---------------------------|
| Backend       | Django 5.x (custom user model) |
| Frontend      | Tailwind CSS, Heroicons   |
| Admin Theme   | [Jazzmin](https://github.com/farridav/django-jazzmin) |
| Database      | MySQL                     |
| Auth          | Django built-in (email-based login) |
| Deployment    | Gunicorn + NGINX ready    |

---

## ⚙️ Installation

### 1. Clone the repository

```bash
git clone https://github.com/saislamb97/university-library.git
cd university-library
````

### 2. Set up virtual environment

```bash
python -m venv env
source env/bin/activate
```

### 3. Install dependencies

```bash
pip install -r requirements.txt
```

### 4. Configure environment variables

Create a `.env` file in the project root:

```env
DJANGO_SECRET_KEY=your-secret-key
DEBUG=True
HOST_URL=http://127.0.0.1:8000

DATABASE_NAME=library
DATABASE_USER=root
DATABASE_PASSWORD=root
DATABASE_HOST=localhost
DATABASE_PORT=3306

DJANGO_ALLOWED_HOSTS=127.0.0.1,localhost
MEDIA_ROOT=../media
```

### 5. Run migrations

```bash
python manage.py makemigrations
python manage.py migrate
```

### 6. Create superuser

```bash
python manage.py createsuperuser
```

### 7. Run the server

```bash
python manage.py runserver
```

---

## 🧪 Sample Users

| Email                                         | Role       | Password   |
| --------------------------------------------- | ---------- | ---------- |
| [admin@library.com](mailto:admin@library.com) | Superadmin | admin123   |
| [user@library.com](mailto:user@library.com)   | Student    | student123 |

(You can seed these manually or through fixtures)

---

## 📁 Project Structure

```bash
library/
├── homeapp/              # Core app for users, books, students
├── templates/            # Custom HTML templates
├── static/               # Static assets (JS, CSS, images)
├── media/                # Uploaded media files
├── .env                  # Environment variables
├── manage.py             # Django entry point
└── requirements.txt      # Python dependencies
```

---

## ✨ Admin Dashboard

Jazzmin provides a powerful admin panel with:

* Searchable lists
* Inline filtering
* Custom branding and themes
* Dark mode support

Accessible at: [http://127.0.0.1:8000/admin](http://127.0.0.1:8000/admin)

---

## 🛡 Security Notes

* ✅ `.env` loaded via `python-dotenv`
* ✅ CORS/CSRF correctly scoped
* ✅ `X_FRAME_OPTIONS = 'DENY'`
* ✅ `DEBUG=False` in production
* ✅ Strong password validators enabled

---

## 📦 Deployment Ready

Compatible with:

* Gunicorn
* NGINX
* Docker (optional)
* AWS EC2 / Ubuntu / Cloud VPS