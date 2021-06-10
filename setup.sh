#!/bin/bash
#
# ----------------------------------------------------------------
# Description: This script loads RH52 and starts a virtual machine
# Requirements: wget and QEMU
# ----------------------------------------------------------------
#
mkdir qemu-redhat52
cd qemu-redhat52
# Get the disk image
wget https://archive.org/download/redhat-5.2_release/redhat-5.2-i386.iso
# Create a hard disk for our virtual machine
qemu-img create -f qcow2 redhat52.img 1G
# Start the virtual machine
qemu-system-i386 -hda redhat52.img -cdrom redhat-5.2-i386.iso -m 256 -vga cirrus -net nic,model=ne2k_pci -net user