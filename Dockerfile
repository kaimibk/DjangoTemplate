FROM python:3.7.6-alpine

ENV PYTHONUNBUFFERED 1

RUN apk add --update --no-cache postgresql-client python3-dev \
  libffi-dev jpeg-dev freetype-dev libjpeg-turbo-dev libpng-dev \
  curl libxml2-dev libxslt-dev libstdc++
RUN apk add --update --no-cache --virtual .tmp-build-deps \
  gcc libc-dev linux-headers postgresql-dev musl-dev zlib zlib-dev \
  g++

RUN /usr/local/bin/python -m pip install --upgrade pip

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user
