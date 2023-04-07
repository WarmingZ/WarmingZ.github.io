# Create a Jekyll container from Ruby Alphine image

# At a minimum, use Ruby 2.5 or later

FROM ruby:2.7-alpine3.15

# Add Jekyll dependencies to Alpine

RUN apk update
RUN apk add --no-cache build-base gcc cmake git

# Update the Ruby bundler and install Jekyll
RUN gem update bundler
RUN gem install bundler 'jekyll:4.2'




