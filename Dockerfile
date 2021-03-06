FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN apt-get install -y qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x
RUN mkdir /eebulle
WORKDIR /eebulle
COPY Gemfile /eebulle/Gemfile
COPY Gemfile.lock /eebulle/Gemfile.lock
RUN bundle install
COPY . /eebulle
