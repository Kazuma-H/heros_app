FROM ruby:2.5.3

ENV LANG ja_JP.utf8
ENV GEM_HOME /bundle
ENV BUNDLE_JOBS 4
ENV BUNDLE_RETRY 3
ENV BUNDLE_PATH $GEM_HOME
ENV BUNDLE_APP_CONFIG $BUNDLE_PATH
ENV BUNDLE_BIN $BUNDLE_PATH/bin
ENV PATH /app/bin:$BUNDLE_BIN:$PATH

RUN set -x && curl -sL https://deb.nodesource.com/setup_14.x | bash -

RUN set -x && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list

RUN set -x && apt-get update -qq && \
  apt-get install -yq build-essential nodejs yarn vim default-mysql-client

RUN set -x && gem update --system && gem install bundler:2.1.2

RUN mkdir -p /app
WORKDIR /app