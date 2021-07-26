# Creating the BCS Manager image...

FROM ubuntu:20.04

SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    locales \
    python3-pip

# Set the locale
ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8     

WORKDIR /app

COPY bcsm_1_8_88_amd64.deb /app/bcsm.deb

RUN apt install -y ./bcsm.deb

CMD ["bash"]
