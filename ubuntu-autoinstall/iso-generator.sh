#!/bin/bash
###########################
#apt install xorriso squashfs-tools python3-debian gpg liblz4-tool python3-pip -y

#git clone https://github.com/mwhudson/livefs-editor

#cd livefs-editor/

#python3 -m pip install .
############################
export ORIG_ISO="ubuntu-22.04.3-live-server-amd64.iso"
mkdir mnt1
mount -o loop $ORIG_ISO mnt1
cp --no-preserve=all mnt1/boot/grub/grub.cfg /tmp/grub.cfg
sed -i 's/linux	\/casper\/vmlinuz  ---/linux	\/casper\/vmlinuz autoinstall quiet ---/g' /tmp/grub.cfg
sed -i 's/timeout=30/timeout=1/g' /tmp/grub.cfg
export MODDED_ISO="${ORIG_ISO::-4}-autoinstall.iso"
livefs-edit $ORIG_ISO $MODDED_ISO --cp /tmp/grub.cfg new/iso/boot/grub/grub.cfg
umount mnt1/
rm -rf mnt1/
