FROM amazonlinux

RUN mkdir /cdk

COPY ./requirements.txt /cdk/
COPY ./entrypoint.sh /usr/local/bin/

WORKDIR /cdk
RUN curl --silent --location https://rpm.nodesource.com/setup_12.x | bash - &&\
    yum -y install \
    python3 \
    git \
    nodejs \
    npm \
    gcc \
    musl-dev \
    perl=5.28.2-r1 &&\
    npm i -g aws-cdk &&\
    pip3 install -r requirements.txt &&\
    pip3 install awscli &&\
    rm -rf /var/cache/yum/*

ENTRYPOINT ["entrypoint.sh"]


