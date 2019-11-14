#!/bin/sh

if [[ $1 == "bash" ]];then
    /bin/bash
else
    exec cdk $@
fi
