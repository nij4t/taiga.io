FROM python:3.5
MAINTAINER Ivan Pedrazas "ipedrazas@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update  && apt-get autoremove -y && apt-get install locales -y
RUN locale-gen en_US.UTF-8 && dpkg-reconfigure locales

WORKDIR /usr/src/app/taiga-back

COPY taiga-back/requirements.txt .
RUN pip install -r requirements.txt

COPY docker-settings.py settings/local.py

COPY locale.gen /etc/locale.gen
COPY default.locale /etc/default/locale

COPY taiga-back .
COPY regenerate.sh .

EXPOSE 8000

VOLUME ["/taiga/static","/taiga/media"]

RUN locale -a

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
