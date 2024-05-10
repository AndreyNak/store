FROM ruby:3.1.1-alpine3.15

RUN apk add --update build-base bash bash-completion libffi-dev tzdata postgresql-client postgresql-dev nodejs npm yarn sudo

WORKDIR /app

RUN gem install bundler

COPY Gemfile* /app/

RUN bundle install

RUN bundle binstubs --all

CMD [ "/bin/bash" ]