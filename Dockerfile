FROM python:3.6-alpine

COPY . /app
WORKDIR /app

ENV MONGODB_DB "stats"
ENV MONGODB_USERNAME ""
ENV MONGODB_PASSWORD ""
ENV MONGODB_HOST "mongo"

ENV FLASK_APP app.py

ENV prometheus_multiproc_dir /app/metrics

RUN pip install -r /app/requirements.txt

CMD gunicorn app:app -b 0.0.0.0:8080 -w 4
