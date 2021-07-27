# import pre-built image nvidia/cuda that comes with pre-installed CUDA packages
FROM nvidia/cuda:11.4.0-base-ubuntu20.04

# Install Python 3.7 and pip
RUN apt-get -y update \
    && apt-get install -y software-properties-common \
    && apt-get -y update \
    && add-apt-repository universe
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get -y update
RUN apt-get -y install python3.7
RUN apt-get -y install python3-pip
RUN ln -sf /usr/bin/python3.7 /usr/bin/python
RUN python3.7 -m pip install --upgrade --force pip

# unset PYTHONPATH to prevent problems later
ENV PYTHONPATH=

# Install wget
RUN apt-get update \
    && apt-get install -y wget \
    && rm -rf /var/lib/apt/lists/*

# Installing Miniconda
ENV MINICONDA_INSTALLER_SCRIPT=Miniconda3-4.5.4-Linux-x86_64.sh
ENV MINICONDA_PREFIX=/usr/local
RUN wget https://repo.continuum.io/miniconda/$MINICONDA_INSTALLER_SCRIPT
RUN chmod +x $MINICONDA_INSTALLER_SCRIPT
RUN ./$MINICONDA_INSTALLER_SCRIPT -b -f -p $MINICONDA_PREFIX

# Updating Conda with python=3.7 (Required for Xtreme compatibility)
RUN conda install --channel defaults conda python=3.7 --yes
RUN conda update --channel defaults --all --yes

# Create a scripts directory to contain the scripts to be run
RUN mkdir -p /root/scripts
COPY xtreme_install_tools.sh /root/scripts
RUN chmod -R 755 /root/scripts

# Install Git
RUN apt-get update && apt-get install -y git

# Xtreme codebase setup
WORKDIR /root
RUN git clone https://github.com/google-research/xtreme.git
RUN /root/scripts/xtreme_install_tools.sh

