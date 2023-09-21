#!/usr/bin/env bash

FW=$1; shift
[[ -z $FW ]] && echo "You must provide the firmware name (e.g. tasmota32-refactor)" && exit 1

python -m esptool \
    --chip esp32 \
    --before default_reset \
    --after hard_reset write_flash \
    -z \
    --flash_mode dio \
    --flash_freq 40m \
    --flash_size 4MB \
    0x1000 Tasmota/.pio/build/$FW/bootloader.bin \
    0x8000 Tasmota/.pio/build/$FW/partitions.bin \
    0xe000 /Users/matt/.platformio/packages/framework-arduinoespressif32/tools/partitions/boot_app0.bin \
    0x10000 /Users/matt/.platformio/packages/framework-arduinoespressif32/variants/tasmota/tasmota32-safeboot.bin \
    0xe0000 Tasmota/.pio/build/$FW/firmware.bin

