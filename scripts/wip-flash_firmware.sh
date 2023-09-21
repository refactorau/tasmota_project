#!/usr/bin/env bash

pushd Tasmota
pio run -e tasmota32-refactor -t nobuild -t upload
popd

