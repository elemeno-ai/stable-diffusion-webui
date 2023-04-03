FROM ubuntu:22.04
RUN apt-get update \
    && apt-get -y install wget \
    git \
    python3 \
    python3-venv

RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.0-1_all.deb
RUN dpkg -i cuda-keyring_1.0-1_all.deb
COPY stable-diffusion-webui stable-files
#RUN useradd tempuser
#USER tempuser
RUN stable-files/webui.sh
