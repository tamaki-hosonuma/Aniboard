FROM ruby:2.6.6
ARG RAILS_MASTER_KEY
ENV RAILS_MASTER_KEY ${RAILS_MASTER_KEY}
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client chromium-driver 
RUN mkdir /aniboard-portfolio
WORKDIR /aniboard-portfolio
COPY Gemfile /aniboard-portfolio/Gemfile
COPY Gemfile.lock /aniboard-portfolio/Gemfile.lock
ENV BUNDLER_VERSION 2.2.3
RUN gem install bundler -v $BUNDLER_VERSION
RUN bundle install
COPY . /aniboard-portfolio
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
RUN RAILS_ENV=production rails assets:precompile
CMD ["rails", "server", "-b", "0.0.0.0"]