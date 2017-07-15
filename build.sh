#!/bin/bash

docker pull tatsushid/tinycore

docker run \
  --name sedutil \
  --rm \
  -it \
  -v "$(pwd)":/sedutil \
  -w /sedutil \
  tatsushid/tinycore ./run.sh
