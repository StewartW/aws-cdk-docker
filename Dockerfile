FROM python:3.7.4-alpine3.10

RUN mkdir /cdk

COPY ./cdk-packages.txt /cdk/
COPY ./entrypoint.sh /usr/local/bin/

WORKDIR /cdk

RUN apk -U --no-cache add \
    bash \
    git \
    nodejs \
    npm \
    perl=5.28.2-r1 &&\
    npm i -g aws-cdk@v1.26.0 &&\
    pip3 install -r cdk-packages.txt &&\
    pip3 install awscli &&\
    rm -rf /var/cache/apk/*

ENTRYPOINT ["entrypoint.sh"]

