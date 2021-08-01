# pull official base image
FROM python:3.9-slim


RUN set -ex && mkdir /app
WORKDIR /app

COPY requirements.txt /app/
RUN pip install -r requirements.txt

COPY . /app

CMD python manage.py collectstatic --noinput && python3 manage.py migrate && gunicorn -w 1 -b 0.0.0.0:8000 collapse.wsgi