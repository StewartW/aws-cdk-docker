FROM python:3.7.4-alpine3.10

RUN mkdir /cdk

COPY ./cdk-packages.txt /cdk/
COPY ./entrypoint.sh /usr/local/bin/

WORKDIR /cdk

RUN apk -U --no-cache add \
    bash \
    git \
    nodejs=10.16.3-r0 \
    npm=10.16.3-r0 \
    perl=5.28.2-r1 &&\
    npm i -g aws-cdk@v1.8.0 &&\
    pip3 install -r cdk-packages.txt &&\
    rm -rf /var/cache/apk/*

ENTRYPOINT ["entrypoint.sh"]

