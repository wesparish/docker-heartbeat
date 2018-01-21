#!/bin/bash

docker build -t wesparish/heartbeat:5.6.2-1.0 . && \
  docker tag wesparish/heartbeat:5.6.2-1.0 wesparish/heartbeat:latest && \
  docker push wesparish/heartbeat:5.6.2-1.0 && \
  docker push wesparish/heartbeat:latest
