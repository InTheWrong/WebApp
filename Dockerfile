# HackTheArch Dockerfile
# VERSION 1.0

FROM ruby:2.3
MAINTAINER Paul Jordan <paullj1@gmail.com>

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        nodejs \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /itr
WORKDIR /itr
ADD Gemfile Gemfile.lock /itr/
RUN bundle install
ADD . /itr
RUN chown -R $USER:$USER .

EXPOSE 3000
