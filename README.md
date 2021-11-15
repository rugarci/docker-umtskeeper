# docker-umtskeeper  


umtskeeper:
    image: rugarci/docker-umtskeeper
    command: --sakisoperators "USBINTERFACE='0' USBMODEM='19d2:1180' APN='gprs-service.com' " --sakisswitches "--sudo --console" --log --logfile /dev/stdout --httpserver
    privileged: true
    networks:
      - rubenet_net
    ports:
      - 8000:8000
    cap_add:
      - net_admin
      - net_raw
    restart: always


docker run -it --rm --name umtskeeper umtskeeper --sakisoperators "USBINTERFACE='0' USBMODEM='19d2:1180' APN='gprs-service.com' " --sakisswitches "--sudo --console" --log
