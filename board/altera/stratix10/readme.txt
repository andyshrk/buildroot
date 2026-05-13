SoCFPGA Stratix 10 SoCDK

Build:
  make socfpga_stratix10_socdk_defconfig
  make

Flash:
  dd if=output/images/sdcard.img of=/dev/sdX bs=4M

Boot:
  Insert SD card, power on. Serial console on ttyS0 at 115200 baud.
  U-Boot loads kernel and DTB from the FAT32 partition via extlinux.
