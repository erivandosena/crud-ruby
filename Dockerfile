FROM ruby:2.7.4

RUN apt-get update -y \
    && apt-get install -y nginx

COPY config/docker/nginx.conf /etc/nginx/nginx.conf

RUN rm /etc/nginx/sites-enabled/default

ARG COMMIT_SHA
ARG VERSION

WORKDIR /app

COPY . .

RUN bundle install

RUN bundle exec rake assets:precompile

EXPOSE 80

LABEL org.opencontainers.image.title="Official Ruby image" \
    org.opencontainers.image.description="Aplicativo crud básico em Ruby" \
    org.opencontainers.image.url="https://hub.docker.com/r/erivando/crud-tarefas-ruby" \
    org.opencontainers.image.source="https://github.com/erivandosena/crud-ruby" \
    org.opencontainers.image.version="${VERSION}" \
    org.opencontainers.image.revision="${COMMIT_SHA}" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.maintainer="Erivando Sena<erivandosena@gmail.com>"

CMD service nginx start && bundle exec rails server -b 0.0.0.0