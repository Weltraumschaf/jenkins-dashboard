#!/bin/bash

# Install all necesary Ruby/Gem stuff with RVM.
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm requirements
rvm install ruby
rvm use ruby --default
rvm rubygems current
gem install bundler

# Bundle everything.
bundle install --path vendor/bundle
