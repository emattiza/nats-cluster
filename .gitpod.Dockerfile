FROM gitpod/workspace-go
USER root
WORKDIR /tmp
RUN mkdir -p /usr/local/bin
RUN wget -O ./nats.deb https://github.com/nats-io/natscli/releases/download/v0.0.30/nats-0.0.30-amd64.deb
RUN dpkg -i ./nats.deb
USER gitpod
RUN mkdir -p /home/gitpod/.local/bin
RUN curl -LO https://raw.githubusercontent.com/nats-io/nsc/main/install.sh
RUN sh install.sh -s /home/gitpod/.local/bin
RUN sudo install-packages wireguard openresolv
RUN curl -L https://fly.io/install.sh | FLYCTL_INSTALL=/home/gitpod/.local sh
WORKDIR /home/gitpod
RUN echo "export PATH=$PATH:/home/gitpod/.local/bin" | sudo tee -a ~/.bashrc.d/71_fly.sh
