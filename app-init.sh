#!/usr/bin/env sh
set -e

bundle check || bundle install -j4 --retry 3

export RACK_ENV=development

bin/rake db:prepare
bin/rackup -o 0.0.0.0
