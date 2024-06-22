Cool Pi 4B
==============
https://cool-pi.com/topic/145/coolpi-4b-hardware-info

Build:
======
  $ make coolpi_4b_defconfig
  $ make

Files created in output directory
=================================

output/images
.
output/images/
├── boot.vfat
├── extlinux
│   └── extlinux.conf
├── Image
├── Image.gz
├── rk3588_bl31_v1.40.elf
├── rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.12.bin
├── rk3588s-coolpi-4b.dtb
├── rootfs.ext2
├── rootfs.ext4 -> rootfs.ext2
├── rootfs.tar
├── sdcard.img
├── u-boot.bin
└── u-boot-rockchip.bin

Creating bootable SD card:
==========================

Simply invoke (as root)

sudo dd if=output/images/sdcard.img of=/dev/sdX && sync

Where X is your SD card device.

Booting:
========

Serial console:
---------------
The Cool Pi 4B has a 40-pin GPIO header.

The Uart pins are as follows:

pin 6:  gnd
pin 8:  tx
pin 10: rx

Baudrate for this board is 1500000.

Login:
------
Enter 'root' as login user, and the prompt is ready.

Network:
WIFI:     Cool Pi 4B has a aic8800 sdio wifi on board, but
          aic8800 is not supported by linux mainine yet.
Ethernet: A RJ-45 interface drivered by PCIE Realtek Ethernet adapter R8169.
          So we can login it by ssh: ssh root@172.16.12.166
          Remember to replace you own ip addres on this board.
