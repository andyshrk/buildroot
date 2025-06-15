RK3566 BOX Demo
==============

Build:
======
  $ make rk3576_defconfig
  $ make

Files created in output directory
=================================

output/images
.
output/images/
├── boot.vfat
├── extlinux
│   └── extlinux.conf
├── Image.gz
├── rk3576_ddr_lp4_2112MHz_lp5_2736MHz_v1.09.bin
├── rk3576-evb1-v10.dtb
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

Also can be write to sdcard by Etcher

Booting:
========

Serial console:
---------------
Baudrate for this board is 1500000.

Login:
------
Enter 'root' as login user, and the prompt is ready.

Network:
-------
Ethernet: Two RJ-45 interface.
          So we can login it by ssh: ssh root@172.16.12.166
          Remember to replace you own ip addres on this board.

Weston:
------
Eanble Wayland Desktop:
weston --backend=drm-backend.so -i 0
