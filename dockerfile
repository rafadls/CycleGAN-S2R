FROM nvidia/cuda:10.0-devel

RUN apt update && apt install -y wget unzip curl bzip2 git
RUN curl -LO http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b
RUN rm Miniconda3-latest-Linux-x86_64.sh
ENV PATH=/miniconda/bin:${PATH}
RUN conda update -y conda
RUN conda install python=3.6
RUN conda install pip

RUN conda install -y pytorch torchvision -c pytorch
RUN mkdir /workspace/ && cd /workspace/ && git clone https://github.com/rafadls/CycleGAN-S2R.git && cd CycleGAN-S2R && pip install -r requirements.txt

WORKDIR /workspace