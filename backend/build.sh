#!/usr/bin/env bash

set -ex

pushd backend

  ./ceylonb compile

  ./ceylonb \
      run test.io.eldermael.doombot \
      ./features/ \
      --glue classpath:test/io/eldermael/doombot \
      --plugin pretty


  if [ "${1}" == "--start" ]; then
      ./ceylonb run io.eldermael.doombot
  fi

popd
