FROM ruby:2.6.6
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn chromium-driver 
RUN mkdir /aniboard
WORKDIR /aniboard
COPY Gemfile /aniboard/Gemfile
COPY Gemfile.lock /aniboard/Gemfile.lock
ENV BUNDLER_VERSION 2.2.3
RUN gem install bundler -v $BUNDLER_VERSION
RUN bundle install
COPY . /aniboard
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]