FROM ubuntu:18.04

RUN apt update && apt install -y \
    curl \
    git \
    iputils-ping \
    jq \
    nano \
    rsync \
    software-properties-common \
    ssh \
    sudo \
    vim

RUN addgroup azureuser \
    && adduser --system --group azureuser \
    && adduser azureuser sudo \
    && chmod +w /etc/sudoers \
    && echo "azureuser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers \
    && chmod -w /etc/sudoers
USER azureuser

RUN curl https://baltocdn.com/helm/signing.asc | sudo apt-key add - \
    && echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list \
    && sudo apt update \
    && sudo apt install helm

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
