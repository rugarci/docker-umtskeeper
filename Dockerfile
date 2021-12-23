FROM python:2

ARG BUILD_DATE
ARG VERSION
ARG VCS_REF

ARG UMTSKEEPER_VERSION="2.08"

LABEL org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="docker-umtskeeper" \
    org.label-schema.version=$VERSION \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/rugarci/docker-umtskeeper" \
    org.label-schema.vcs-type="Git" \
    org.label-schema.schema-version="1.0" \
    org.opencord.component.umtskeeper.version=v$UMTSKEEPER_VERSION \
    org.opencord.component.umtskeeper.vcs-url="https://github.com/daladim/umtskeeper"

RUN apt-get update && apt-get install -y --force-yes net-tools usbutils ppp

RUN mkdir /umtskeeper
WORKDIR /umtskeeper

ADD https://github.com/daladim/umtskeeper/archive/refs/tags/v${UMTSKEEPER_VERSION}.zip /umtskeeper

RUN unzip /umtskeeper/v${UMTSKEEPER_VERSION}.zip

WORKDIR /umtskeeper/umtskeeper-${UMTSKEEPER_VERSION}

ENTRYPOINT [ "python", "umtskeeper" ]
