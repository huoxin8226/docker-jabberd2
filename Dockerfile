# Copyright 2015 Sean Nelson <audiohacked@gmail.com>
# This file is part of audiohacked/docker-containers.
#
# audiohacked/docker-containers is free software: you can redistribute
# it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# audiohacked/docker-containers is distributed in the hope that
# it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Foobar.  If not, see <http://www.gnu.org/licenses/>.

FROM debian:stretch
MAINTAINER Sean Nelson <audiohacked@gmail.com>

ARG SERVER_ADMIN
ENV SERVER_ADMIN                ${SERVER_ADMIN:-"admin"}
ARG SERVER_DOMAIN
ENV SERVER_DOMAIN               ${SERVER_DOMAIN:-"xmpp.hyperkineticnerd.com"}
ARG SERVER_ROUTER_USER
ENV SERVER_ROUTER_USER          ${SERVER_ROUTER_USER:-"jabberd"}
ARG SERVER_ROUTER_PASS
ENV SERVER_ROUTER_PASS          ${SERVER_ROUTER_PASS:-"secret"}
ARG SERVER_STORAGE
ENV SERVER_STORAGE              ${SERVER_STORAGE:-""}
ARG SERVER_STORAGE_MYSQL_SERV
ENV SERVER_STORAGE_MYSQL_SERV   ${SERVER_STORAGE_MYSQL_SERV:-"127.0.0.1"}
ARG SERVER_STORAGE_MYSQL_USER
ENV SERVER_STORAGE_MYSQL_USER   ${SERVER_STORAGE_MYSQL_USER:-"jabberd"}
ARG SERVER_STORAGE_MYSQL_PASS
ENV SERVER_STORAGE_MYSQL_PASS   ${SERVER_STORAGE_MYSQL_PASS:-""}
ARG SERVER_STORAGE_MYSQL_DB
ENV SERVER_STORAGE_MYSQL_DB     ${SERVER_STORAGE_MYSQL_DB:-"jabberd"}


# WORKDIR /usr/local
# USER root
RUN apt-get update && apt-get install -y jabberd2 xmlstarlet
COPY settings.sh /usr/local/bin
# USER jabber
VOLUME ["/var/lib/jabberd2", "/var/log/jabberd2", "/var/run/jabberd2", "/etc/jabberd2"]
EXPOSE 5222 5223 5269 5347

CMD /usr/local/bin/settings.sh && \
    /etc/init.d/jabberd2 start
