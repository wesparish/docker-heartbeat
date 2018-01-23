#!/bin/bash

confd -backend rancher -interval 10 &
sleep 2
exec ./heartbeat "$@"
