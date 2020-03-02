FROM ruby:2.4-alpine

#COPY Gemfile /Gemfile
RUN gem install sinatra

ADD main.rb /main.rb
ENV MY_KEY="Hello from Dockerfile"
CMD ruby /main.rb
