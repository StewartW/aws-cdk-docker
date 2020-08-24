FROM python:3.7.4-alpine3.10

RUN mkdir /cdk

COPY ./requirements.txt /cdk/
COPY ./entrypoint.sh /usr/local/bin/

WORKDIR /cdk

RUN apk -U --no-cache add \
    bash \
    git \
    nodejs \
    npm \
    gcc \
    musl-dev \
    npm i -g aws-cdk &&\
    pip3 install -r requirements.txt &&\
    pip3 install awscli &&\
    rm -rf /var/cache/apk/*

ENTRYPOINT ["entrypoint.sh"]


