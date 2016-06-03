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

RUN pip install dopy==0.3.5

RUN git clone https://github.com/jlund/streisand.git

VOLUME /root/.ssh

WORKDIR /streisand

CMD ["/bin/sh", "/streisand/streisand"]
