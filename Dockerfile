FROM ruby:3.1.1-alpine3.15

# Установка зависимостей
RUN apk add --update \
  build-base \
  bash \
  bash-completion \
  libffi-dev \
  tzdata \
  postgresql-client \
  postgresql-dev \
  nodejs \
  npm \
  yarn \
  sudo

WORKDIR /app

# Установка bundler
RUN gem install bundler

# Копирование Gemfile и Gemfile.lock
COPY Gemfile* /app/

# Установка гемов
RUN bundle install

# Копирование остального кода приложения
COPY . /app

# Открытие порта для приложения
EXPOSE 3000

# Запуск сервера Rails
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
