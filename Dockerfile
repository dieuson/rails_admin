FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
ENV BUNDLER_VERSION=2.0.1
RUN gem install bundler -v 2.0.1
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle check || bundle install

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]