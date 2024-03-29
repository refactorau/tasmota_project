#!/usr/bin/env bash

pushd Tasmota-firmware
git rm -fr development-firmware/*
git rm -fr firmware/*
git rm -fr manifest_ext/*
mkdir -p development-firmware/tasmota32 manifest_ext
popd

pushd Tasmota
rm -fr Tasmota/build_output
pio run -e tasmota32-refactor
cp -a build_output/firmware/tasmota32-* ../Tasmota-firmware/development-firmware/tasmota32
cp -a build_output/map ../Tasmota-firmware/development-firmware
popd

pushd Tasmota-firmware
python genManifest.py
popd
