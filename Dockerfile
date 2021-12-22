FROM ruby:2.6.6
ARG RAILS_MASTER_KEY
ENV RAILS_MASTER_KEY ${RAILS_MASTER_KEY}
SHELL ["/bin/bash", "-c"]
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client chromium-driver vim
RUN apt-get install -y nodejs npm && npm install n -g && n 14.17.0
RUN set -x && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list

RUN set -x && apt-get update -qq && \
  apt-get install -yq build-essential yarn
RUN mkdir /aniboard
WORKDIR /aniboard
COPY Gemfile /aniboard/Gemfile
COPY Gemfile.lock /aniboard/Gemfile.lock
ENV BUNDLER_VERSION 2.2.3
RUN gem install bundler -v $BUNDLER_VERSION
RUN bundle install
COPY package*.json ./
# COPY . /aniboard
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
RUN RAILS_ENV=production rails assets:precompile
CMD ["rails", "server", "-b", "0.0.0.0"]