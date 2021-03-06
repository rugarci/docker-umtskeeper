# docker-umtskeeper

[![Latest Github release](https://img.shields.io/github/release/rugarci/docker-umtskeeper.svg)](https://github.com/rugarci/docker-umtskeeper/releases/latest)
[![Image size](https://img.shields.io/docker/image-size/rugarci/umtskeeper/latest)](https://hub.docker.com/r/rugarci/umtskeeper)
[![Docker Pulls](https://img.shields.io/docker/pulls/rugarci/umtskeeper.svg)](https://hub.docker.com/r/rugarci/umtskeeper)

https://github.com/daladim/umtskeeper

Tested on Raspberry Pi Zero 2

## Usage

```bash
docker run -it --rm --name umtskeeper rugarci/umtskeeper --sakisoperators "OTHER='USBMODEM' USBINTERFACE='0' USBMODEM='19d2:1180' APN='gprs-service.com' " --sakisswitches "--sudo --console" --log
```

For Docker compose

```yaml

 umtskeeper:
    image: rugarci/umtskeeper
    command: --sakisoperators "OTHER='USBMODEM' USBINTERFACE='0' USBMODEM='19d2:1180' APN='gprs-service.com' " --sakisswitches "--sudo --console" --log --logfile /dev/stdout --httpserver --statfilepath /data
    privileged: true
    network_mode: host
    environment:
      - TZ=Europe/Madrid
    volumes:
      - /data:/data
      - "/etc/timezone:/etc/timezone:ro"
      - "/etc/localtime:/etc/localtime:ro"
    restart: always

```


