import os
import uuid
from django.db import models
from django.contrib.auth.models import AbstractUser, BaseUserManager
from django.core.exceptions import ValidationError
from django.db.models.signals import post_save
from django.dispatch import receiver

# ===============================
# Utility Functions
# ===============================

def generate_unique_id():
    return uuid.uuid4().hex.upper()

def profile_upload_path(instance, filename):
    name_part = (instance.username or instance.email.split('@')[0]).lower().replace(" ", "_")
    return os.path.join(f'profiles/{name_part}/', f"{uuid.uuid4().hex}_{filename}")

def create_unique_username(email):
    base = email.split('@')[0]
    username = base
    counter = 1
    while User.objects.filter(username=username).exists():
        username = f"{base}{counter}"
        counter += 1
    return username

# ===============================
# Custom User & Manager
# ===============================

class UserManager(BaseUserManager):
    use_in_migrations = True

    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError("Email is required.")
        email = self.normalize_email(email)
        extra_fields.setdefault('is_active', True)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password=None, **extra_fields):
        extra_fields.setdefault("is_staff", True)
        extra_fields.setdefault("is_superuser", True)
        if not extra_fields["is_staff"] or not extra_fields["is_superuser"]:
            raise ValueError("Superuser must have is_staff=True and is_superuser=True.")
        return self.create_user(email, password, **extra_fields)

class User(AbstractUser):
    email = models.EmailField(unique=True)
    username = models.CharField(max_length=150, unique=True, null=True, blank=True)
    profile = models.ImageField(upload_to=profile_upload_path, blank=True, null=True)
    is_student = models.BooleanField(default=False)
    approved = models.BooleanField(default=False)

    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = []

    objects = UserManager()

    class Meta:
        indexes = [models.Index(fields=["email"])]
        verbose_name = "User"
        verbose_name_plural = "Users"

    def __str__(self):
        return self.email

    def save(self, *args, **kwargs):
        if not self.username:
            self.username = create_unique_username(self.email)
        super().save(*args, **kwargs)

# ===============================
# Academic Courses
# ===============================

class Course(models.Model):
    code = models.CharField(max_length=10, unique=True)
    name = models.CharField(max_length=255)
    description = models.TextField(blank=True)

    def __str__(self):
        return f"{self.code} - {self.name}"

# ===============================
# Library Books
# ===============================

class Book(models.Model):
    title = models.CharField(max_length=255)
    author = models.CharField(max_length=255, blank=True)
    isbn = models.CharField(max_length=13, unique=True, default=generate_unique_id)
    course = models.ForeignKey(Course, null=True, blank=True, on_delete=models.SET_NULL)
    total_copies = models.PositiveIntegerField(default=10)
    available_copies = models.PositiveIntegerField(default=10)

    def __str__(self):
        return f"{self.title} by {self.author}" if self.author else self.title

# ===============================
# Student Profile
# ===============================

class StudentProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    matric_no = models.CharField(max_length=20, unique=True)
    faculty = models.CharField(max_length=100)
    course = models.ForeignKey(Course, on_delete=models.SET_NULL, null=True, blank=True)

    def __str__(self):
        return f"{self.user.get_full_name()} ({self.matric_no})"

# ===============================
# Borrow Record
# ===============================

class BorrowRecord(models.Model):
    student = models.ForeignKey(StudentProfile, on_delete=models.CASCADE)
    book = models.ForeignKey(Book, on_delete=models.CASCADE)
    borrowed_at = models.DateTimeField(auto_now_add=True)
    returned_at = models.DateTimeField(null=True, blank=True)

    def clean(self):
        if not self.returned_at and self.book.available_copies <= 0:
            raise ValidationError("No available copies to borrow.")

    def save(self, *args, **kwargs):
        if not self.pk and not self.returned_at:
            # New borrow
            if self.book.available_copies <= 0:
                raise ValidationError("Book is not available.")
            self.book.available_copies -= 1
            self.book.save()
        elif self.pk and self.returned_at:
            # Return
            if not BorrowRecord.objects.get(pk=self.pk).returned_at:
                self.book.available_copies += 1
                self.book.save()
        super().save(*args, **kwargs)

    class Meta:
        verbose_name = "Borrow Record"
        verbose_name_plural = "Borrow Records"
        ordering = ['-borrowed_at']
        unique_together = ('student', 'book', 'borrowed_at')

    def __str__(self):
        return f"{self.student} → {self.book}"

# ===============================
# Signal to create student profile
# ===============================

@receiver(post_save, sender=User)
def create_student_profile(sender, instance, created, **kwargs):
    if created and instance.is_student:
        StudentProfile.objects.get_or_create(user=instance, defaults={
            'matric_no': generate_unique_id(),
            'faculty': 'Unknown'
        })
