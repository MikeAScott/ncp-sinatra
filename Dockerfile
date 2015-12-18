FROM mikeascott/tiny-ruby:latest
MAINTAINER Mike Scott <mike.scott@sqs.com>

ENV APP_DIR /usr/app

# Switch ToAPP_DIR
RUN mkdir -p $APP_DIR
WORKDIR $APP_DIR

COPY Gemfile $APP_DIR
COPY Gemfile.lock $APP_DIR

COPY . $APP_DIR
RUN bundle install

CMD bundle exec ruby app.rb

EXPOSE 4567