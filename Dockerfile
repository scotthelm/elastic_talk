FROM ruby:2.3.0

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

RUN gem install bundler

COPY . /usr/src/app
