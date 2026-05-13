#!/usr/bin/env bash
set -e

BOARD_DIR="$(dirname "$0")"
UBOOT_IMG="${SOCFPGA_EXTERNAL_UBOOT_IMG:-$BOARD_DIR/u-boot.img}"

install -m 0644 "$UBOOT_IMG" "$BINARIES_DIR/u-boot.img"
install -m 0644 -D "$BOARD_DIR/extlinux.conf" "$BINARIES_DIR/extlinux/extlinux.conf"
"$HOST_DIR/bin/mkimage" -A arm -T script -C none -n "S10 script" \
	-d "$BOARD_DIR/u-boot.cmd" "$BINARIES_DIR/u-boot.scr"
support/scripts/genimage.sh -c "$BOARD_DIR/genimage.cfg"
