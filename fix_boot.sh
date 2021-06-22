#! /bin/sh

if [ "$(id -u)" = 0 ]
then
    if [ ! -d "/boot/efi/EFI/Boot.bak/" ]
    then
        echo "Boot.bak does not exists"    
        mv /boot/efi/EFI/Boot /boot/efi/EFI/Boot.bak
        cp -R /boot/efi/EFI/ubuntu /boot/efi/EFI/Boot
        mv /boot/efi/EFI/Boot/shimx64.efi /boot/efi/EFI/Boot/bootx64.efi
    else
        echo "Boot.bak exists"
        rsync -ar --delete /boot/efi/EFI/Boot/ /boot/efi/EFI/Boot.bak/
        rsync -ar --delete /boot/efi/EFI/ubuntu/ /boot/efi/EFI/Boot/
        mv /boot/efi/EFI/Boot/shimx64.efi /boot/efi/EFI/Boot/bootx64.efi
    fi
    echo "Please reboot your system"
else
    echo "Please run as root"
fi
