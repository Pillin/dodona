# syntax=docker/dockerfile:1
FROM ruby:3.1.2-bullseye

ENV BUNDLE_PATH=/bundle \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3 \
    RAILS_ENV=development \
    NODE_ENV=development

RUN apt-get update -qq \ 
  && apt-get install -y --no-install-recommends \ 
    build-essential \ 
    libmariadb-dev \ 
    libvips \ 
    curl \ 
    ca-certificates \ 
    git \ 
    netcat-openbsd \ 
  && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \ 
  && apt-get install -y --no-install-recommends nodejs \ 
  && rm -rf /var/lib/apt/lists/*

RUN corepack enable && corepack prepare yarn@1.22.22 --activate

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY package.json yarn.lock ./
RUN yarn install

COPY . .

EXPOSE 3000

ENTRYPOINT ["./bin/docker-entrypoint.sh"]
CMD ["web"]
