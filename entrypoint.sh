#!/bin/bash
set -e

bundle exec rails db:migrate 2>/dev/null || bundle exec rails db:create db:migrate db:seed
# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"