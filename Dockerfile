FROM continuumio/miniconda3
MAINTAINER Nikita Kazeev kazeevn@yandex-team.ru

RUN apt-get update
RUN apt-get install -y pkg-config libfreetype6-dev g++

COPY environment.yml /environment.yml
RUN conda env create -f /environment.yml

COPY start.sh /root/start.sh
EXPOSE 8888
CMD /root/start.sh
