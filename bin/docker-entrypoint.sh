#!/usr/bin/env bash
set -e

if [ -n "${DATABASE_URL}" ]; then
  ruby -e "require 'uri'; uri = URI(ENV['DATABASE_URL']); host = uri.host; port = uri.port || 3306; if host.nil?; exit 0; end; require 'socket'; 60.times do; begin; s = TCPSocket.new(host, port); s.close; exit 0; rescue StandardError; sleep 1; end; end; abort 'Database not reachable';"
fi

case "$1" in
  web|"")
    mkdir -p tmp/pids tmp/cache tmp/sockets
    bundle exec rails db:prepare
    exec bundle exec puma -C config/puma.rb
    ;;
  worker)
    mkdir -p tmp/pids tmp/cache tmp/sockets
    bundle exec rails db:prepare
    exec bundle exec rails jobs:work
    ;;
  *)
    exec "$@"
    ;;
esac
