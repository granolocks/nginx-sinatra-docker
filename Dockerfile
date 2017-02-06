# base image
FROM ruby:2.4.0-slim

EXPOSE 80

RUN apt-get update && apt-get install -y vim nginx gcc make
 
ADD nginx.conf /etc/nginx/nginx.conf

ADD Gemfile /Gemfile

RUN bundle install --gemfile=/Gemfile

ADD app/ /app

ADD start.sh /start_stuff

CMD /bin/bash -c /start_stuff && /etc/init.d/nginx start && /bin/bash
