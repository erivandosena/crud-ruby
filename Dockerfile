FROM phusion/passenger-full:2.2.0

RUN apt-get update && apt-get install -y libnginx-mod-http-passenger=1:6.0.18-1~focal1

RUN rm /etc/nginx/sites-enabled/default
RUN rm -f /etc/service/nginx/down
RUN rm -f /etc/service/redis/down

ADD config/nginx.conf /etc/nginx/sites-enabled/app-crud.conf

RUN mkdir -p /var/run/passenger-instreg

USER app

ARG VERSION
ARG COMMIT_SHA
ENV APP_VERSION=$VERSION
ENV COMMIT_SHA=$COMMIT_SHA
ENV NODE_MODULES_CACHE true
ENV RAILS_ENV=production
ENV BUNDLE_WITHOUT="development test"
ENV APP_HOME /home/app/app-crud

RUN mkdir -p ${APP_HOME}

WORKDIR ${APP_HOME}

COPY --chown=app:app Gemfile Gemfile.lock .

RUN bundle install

COPY --chown=app:app . .

RUN SECRET_KEY_BASE=$(bundle exec rake secret)
RUN bundle exec rake db:create \
    && bundle exec rake db:migrate \
    && bundle exec rake assets:precompile

VOLUME [ "${APP_HOME}/db" ]

USER root

EXPOSE 80

LABEL org.opencontainers.image.title="Official Ruby image" \
    org.opencontainers.image.description="Aplicativo crud básico em Ruby" \
    org.opencontainers.image.url="https://hub.docker.com/r/erivando/app-crud-ruby" \
    org.opencontainers.image.source="https://github.com/erivandosena/crud-ruby" \
    org.opencontainers.image.version=$APP_VERSION \
    org.opencontainers.image.revision=$COMMIT_SHA \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.maintainer="Erivando Sena<erivandosena@gmail.com>"

CMD ["/sbin/my_init"]
