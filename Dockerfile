FROM python:3.6-alpine

RUN apk add --no-cache \
      bash \
      build-base \
      ca-certificates \
      cyrus-sasl-dev \
      graphviz \
      jpeg-dev \
      libffi-dev \
      libxml2-dev \
      libxslt-dev \
      openldap-dev \
      openssl-dev \
      postgresql-dev \
      wget \
  && pip install gunicorn==17.5

WORKDIR /opt

ARG BRANCH=v2.0.7
ARG URL=https://github.com/digitalocean/netbox/archive/$BRANCH.tar.gz
RUN wget -q -O - "${URL}" | tar xz \
  && mv netbox* netbox

WORKDIR /opt/netbox
RUN pip install -r requirements.txt

COPY docker/django-netbox-graphql-0.0.2.tar.gz /opt
RUN pip install /opt/django-netbox-graphql-0.0.2.tar.gz

COPY docker/settings.py /opt/netbox/netbox/netbox/settings.py
COPY docker/urls.py /opt/netbox/netbox/netbox/urls.py

RUN ln -s configuration.docker.py netbox/netbox/configuration.py

COPY docker/gunicorn_config.py /opt/netbox/
COPY docker/nginx.conf /etc/netbox-nginx/nginx.conf

COPY docker/docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]

VOLUME ["/etc/netbox-nginx/"]
