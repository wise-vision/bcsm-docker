# Creating the BCS Manager image...

FROM ubuntu:20.04

SHELL ["/bin/bash", "-c"]

RUN apt update && apt install -y \
    python3-pip


WORKDIR /app

COPY bcsm_1_8_88_amd64.deb /app/bcsm.deb

RUN DEBIAN_FRONTEND=noninteractive apt install -y ./bcsm.deb

CMD ["bash"]
