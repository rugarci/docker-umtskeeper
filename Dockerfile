FROM python:2

RUN apt-get update && apt-get install -y --force-yes net-tools usbutils ppp

RUN mkdir /run/umtskeeper
RUN mkdir /umtskeeper
WORKDIR /umtskeeper

ENV umtskeeper_version="2.08"
ADD https://github.com/daladim/umtskeeper/archive/refs/tags/v${umtskeeper_version}.zip /umtskeeper

RUN unzip /umtskeeper/v${umtskeeper_version}.zip

WORKDIR /umtskeeper/umtskeeper-2.08

RUN mv /umtskeeper/umtskeeper-2.08/umtskeeper /usr/local/bin/umtskeeper
RUN mv /umtskeeper/umtskeeper-2.08/sakis3g /usr/local/bin/sakis3g

ENTRYPOINT [ "python", "/usr/local/bin/umtskeeper" ]
