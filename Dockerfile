FROM ruby:2.7.0
ENV LANG C.UTF-8
RUN apt-get update -qq && apt-get install -y build-essential nodejs default-mysql-client
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app
