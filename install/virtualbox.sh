#!/bin/bash

# Actualizar el sistema
sudo pacman -Syu --noconfirm

# Instalar VirtualBox y sus dependencias
sudo pacman -S virtualbox virtualbox-host-modules-arch --noconfirm

# Instalar VirtualBox Extension Pack
VBOX_VERSION=$(pacman -Qi virtualbox | grep Version | awk '{print $3}')
wget https://download.virtualbox.org/virtualbox/$VBOX_VERSION/Oracle_VM_VirtualBox_Extension_Pack-$VBOX_VERSION.vbox-extpack
sudo VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-$VBOX_VERSION.vbox-extpack
rm Oracle_VM_VirtualBox_Extension_Pack-$VBOX_VERSION.vbox-extpack

# Cargar los módulos del kernel de VirtualBox
sudo modprobe vboxdrv
sudo modprobe vboxnetflt
sudo modprobe vboxnetadp
sudo modprobe vboxpci

# Agregar al usuario al grupo vboxusers (reemplaza $USER si necesitas agregar un usuario específico)
sudo gpasswd -a $USER vboxusers

# Habilitar y arrancar el servicio de VirtualBox
sudo systemctl enable vboxservice
sudo systemctl start vboxservice

# Verificar la instalación de VirtualBox
VBoxManage --version

echo "VirtualBox ha sido instalado y configurado correctamente."
echo "Por favor, cierra sesión y vuelve a iniciar sesión o reinicia tu computadora para aplicar los cambios del grupo vboxusers."
