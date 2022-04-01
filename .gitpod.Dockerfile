FROM gitpod/workspace-go
USER root
WORKDIR /tmp
RUN mkdir -p /usr/local/bin
RUN curl -L https://fly.io/install.sh | FLYCTL_INSTALL=/usr/local sh
RUN wget -O ./nats.deb https://github.com/nats-io/natscli/releases/download/v0.0.30/nats-0.0.30-amd64.deb 
RUN dpkg -i ./nats.deb
USER gitpod
