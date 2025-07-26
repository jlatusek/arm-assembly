#!/bin/bash

SYSROOT="${HOME}/x-tools/arm-unknown-linux-gnueabi/arm-unknown-linux-gnueabi/sysroot"
OUT_DIR="out"
QEMU_ARGS=""

if [[ "$1" == "debug" ]]; then
  shift
  QEMU_LD_PREFIX=${SYSROOT} qemu-arm -g 3333 ${QEMU_ARGS} ${OUT_DIR}/main.elf $@ &
  arm-none-eabi-gdb $(OUT_DIR)/main.elf \
    -ex "set sysroot $(SYSROOT)" \
    -ex "target remote :3333" \
    -ex "break main" \
    -ex "continue"
else
  QEMU_LD_PREFIX=${SYSROOT} qemu-arm ${QEMU_ARGS} ${OUT_DIR}/main.elf $@
fi
