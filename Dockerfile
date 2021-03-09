FROM jsii/superchain

RUN mkdir /cdk

COPY ./requirements.txt /cdk/
COPY ./entrypoint.sh /usr/local/bin/

WORKDIR /cdk
RUN curl --silent --location https://rpm.nodesource.com/setup_12.x | bash - &&\
    yum -y install \
    unzip \
    python3 \
    python3-devel \
    git \
    nodejs \
    npm \
    gcc \
    docker \
    musl-dev &&\
    npm i -g aws-cdk &&\
    ln -s /usr/bin/pip3 /usr/bin/pip &&\
    pip install -r requirements.txt &&\
    pip install awscli >=1.18.140 &&\
    rm -rf /var/cache/yum/*

ENTRYPOINT ["entrypoint.sh"]
