#!/bin/bash

# Actualizar el sistema
sudo pacman -Syu --noconfirm

# Instalar Docker
sudo pacman -S docker --noconfirm

# Habilitar e iniciar el servicio Docker
sudo systemctl enable docker
sudo systemctl start docker

# Agregar tu usuario al grupo docker (reemplaza 'tu_usuario' con tu nombre de usuario)
sudo usermod -aG docker $USER

# Instalar Docker Compose
sudo pacman -S docker-compose --noconfirm

# Verificar las versiones instaladas
docker --version
docker-compose --version

echo "Docker y Docker Compose han sido instalados y configurados correctamente."
echo "Por favor, cierra sesión y vuelve a iniciar sesión o reinicia tu computadora para aplicar los cambios del grupo Docker."

