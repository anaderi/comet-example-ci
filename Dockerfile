FROM continuumio/miniconda3
MAINTAINER Nikita Kazeev kazeevn@yandex-team.ru

RUN apt-get update
RUN apt-get install -y pkg-config libfreetype6-dev

COPY environment.yml /environment.yml
RUN conda env create -f /environment.yml
RUN git clone https://github.com/openml/openml-python.git; cd openml-python; git checkout 26686b0dda5b08776ef59e8637c5e3cd81dfca00

RUN /bin/bash -c "source activate open-ml &&  \
  cd openml-python && python setup.py install"

COPY start.sh /root/start.sh
EXPOSE 8888
CMD /root/start.sh
