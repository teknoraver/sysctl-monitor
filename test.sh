#!/bin/bash

while sleep 1; do
        sysctl -q fs.mount-max=$((100000 + RANDOM % 100))
        sysctl -q fs.nr_open=$((1000000000 + RANDOM % 1000))
done
