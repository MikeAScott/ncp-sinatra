FROM mikeascott/tiny-ruby:latest
MAINTAINER Mike Scott <mike.scott@sqs.com>

ENV APP_DIR /usr/app

# Switch To APP_DIR
RUN mkdir -p $APP_DIR
WORKDIR $APP_DIR

COPY Gemfile $APP_DIR
COPY Gemfile.lock $APP_DIR

COPY . $APP_DIR
RUN bundle install

CMD bundle exec rackup -p 8081 -o 0.0.0.0

EXPOSE 8081