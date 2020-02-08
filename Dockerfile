FROM ruby:2.7.0-slim-buster

RUN apt-get update && \
    apt-get install --quiet --yes --no-install-recommends \
      build-essential \
      libpq-dev \
      git

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile* ./

RUN gem install bundler -v '2.1.4' && \
    bundle install -j4 --retry 3

COPY . .
