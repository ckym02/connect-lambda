FROM ruby:2.7.4

ENV RAILS_ROOT /app
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash \
      && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1  apt-key add - \
      && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn

RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
RUN bundle install
