# netbox-docker

This repository houses the components needed to build NetBox as a Docker container. It is a work in progress; please submit a bug report for any issues you encounter.

## Quickstart

To get NetBox up and running:

```
# git clone -b master https://github.com/digitalocean/netbox-docker.git
# cd netbox-docker
# docker-compose up -d
```

The application will be available on http://localhost/ after a few minutes.

Default credentials:

* Username: **admin**
* Password: **admin**

## Configuration

You can configure the app at runtime using variables (see `docker-compose.yml`). Possible environment variables include:

* SUPERUSER_NAME
* SUPERUSER_EMAIL
* SUPERUSER_PASSWORD
* ALLOWED_HOSTS
* DB_NAME
* DB_USER
* DB_PASSWORD
* DB_HOST
* DB_PORT
* SECRET_KEY
* EMAIL_SERVER
* EMAIL_PORT
* EMAIL_USERNAME
* EMAIL_PASSWORD
* EMAIL_TIMEOUT
* EMAIL_FROM
* LOGIN_REQUIRED
* MAINTENANCE_MODE
* NETBOX_USERNAME
* NETBOX_PASSWORD
* PAGINATE_COUNT
* TIME_ZONE
* DATE_FORMAT
* SHORT_DATE_FORMAT
* TIME_FORMAT
* SHORT_TIME_FORMAT
* DATETIME_FORMAT
* SHORT_DATETIME_FORMAT

### Testing gralhql module

This docker image contains last version of netbox downloaded from digital ocean repository. 
Last version of graphql for netbox is located under docker/django-netbox-graphql-0.0.2.tar.gz. 
This module will be installed automatically with docker build. Files settings.py and urls.py contains extra lines
with links and configuration for graphql, because of that they gonna be overwrite with files from docker folder.
 
The easiest way to test query is with UI editor:
http://localhost:XXXXX/graphql/client

Testing with curl requires token:
Make new token http://localhost:XXXXX/user/api-tokens/ have to be logged in (admin/admin)

You can see from here crud examples https://github.com/ninech/django-netbox-graphql/tree/35080-token-authorisation#graphql-crud-examples
 
Docker configuration contains phppgadmin access which can provide loading dump_docker data. 
http://localhost:XXXXX/phppgadmin/

Default login are values from docker.env for fields
* DB_USER # netbox
* DB_PASSWORD # J5brHrAXFLQSif0K
