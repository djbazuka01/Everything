#!/bin/bash

######only firest time#############
#sudo apt-get install cloud-image-utils -y
###################################
rm /mnt/seed.iso
cloud-localds ./seed.iso user-data
cp seed.iso /mnt
rm seed.iso
