FROM alpine:3.4

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
    libffi-dev \
    openssl-dev \
    openssh \
    git

RUN pip install ansible markupsafe

RUN pip install boto dopy==0.3.5 apache-libcloud>=0.17.0 linode-python pyrax

RUN git clone https://github.com/jlund/streisand.git

VOLUME /root/.ssh

WORKDIR /streisand

CMD ["/bin/sh", "/streisand/streisand"]
