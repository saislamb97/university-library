from django.contrib import admin
from django.utils.html import format_html
from .models import User, StudentProfile, Course, Book, BorrowRecord

# ==============================
# User Admin
# ==============================

@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    list_display = ('email', 'is_student', 'is_staff', 'approved')
    list_filter = ('is_student', 'is_staff', 'approved')
    search_fields = ('email', 'username')
    readonly_fields = ('last_login',)
    ordering = ('-date_joined',)
    fieldsets = (
        (None, {'fields': ('email', 'username', 'password')}),
        ('Profile', {'fields': ('profile', 'is_student', 'approved')}),
        ('Permissions', {'fields': ('is_staff', 'is_superuser', 'groups', 'user_permissions')}),
        ('Important dates', {'fields': ('last_login', 'date_joined')}),
    )


# ==============================
# Course Admin
# ==============================

@admin.register(Course)
class CourseAdmin(admin.ModelAdmin):
    list_display = ('code', 'name')
    search_fields = ('code', 'name')
    ordering = ('code',)


# ==============================
# Book Admin
# ==============================

@admin.register(Book)
class BookAdmin(admin.ModelAdmin):
    list_display = ('title', 'author', 'isbn', 'course', 'available_copies', 'total_copies')
    list_filter = ('course',)
    search_fields = ('title', 'author', 'isbn')
    ordering = ('title',)
    readonly_fields = ('isbn',)


# ==============================
# StudentProfile Admin
# ==============================

@admin.register(StudentProfile)
class StudentProfileAdmin(admin.ModelAdmin):
    list_display = ('user_email', 'matric_no', 'faculty', 'course')
    list_filter = ('faculty', 'course')
    search_fields = ('matric_no', 'user__email', 'user__username')
    ordering = ('matric_no',)

    def user_email(self, obj):
        return obj.user.email
    user_email.short_description = 'Email'


# ==============================
# BorrowRecord Admin
# ==============================

@admin.register(BorrowRecord)
class BorrowRecordAdmin(admin.ModelAdmin):
    list_display = ('student_display', 'book', 'borrowed_at', 'returned_at', 'is_returned')
    list_filter = ('book', 'borrowed_at', 'returned_at')
    search_fields = ('student__matric_no', 'student__user__email', 'book__title')
    ordering = ('-borrowed_at',)

    def is_returned(self, obj):
        return obj.returned_at is not None
    is_returned.boolean = True

    def student_display(self, obj):
        return f"{obj.student.user.get_full_name()} ({obj.student.matric_no})"
    student_display.short_description = "Student"

