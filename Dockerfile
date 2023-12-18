# Используйте официальный образ Python
FROM python:3.9

# Установите переменную среды для запуска в режиме не внутри контейнера
ENV PYTHONUNBUFFERED 1

# Создайте и установите рабочую директорию
WORKDIR /app

# Копируйте зависимости проекта в контейнер
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Копируйте остальные файлы проекта в контейнер
COPY . /app/


# Set environment variables for Django
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE myproject.settings

# Collect static files to the STATIC_ROOT directory
RUN python manage.py collectstatic --noinput

# Соберите статику Django
RUN python manage.py collectstatic --noinput

# Откройте порт, который будет слушать приложение
EXPOSE 8000

# Запустите сервер Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
