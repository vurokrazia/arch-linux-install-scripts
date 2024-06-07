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

# Instalar kubectl
sudo pacman -S kubectl --noconfirm

# Descargar Minikube
MINIKUBE_VERSION=$(curl -s https://api.github.com/repos/kubernetes/minikube/releases/latest | grep tag_name | cut -d '"' -f 4)
curl -Lo minikube https://storage.googleapis.com/minikube/releases/${MINIKUBE_VERSION}/minikube-linux-amd64

# Hacer Minikube ejecutable y moverlo al directorio bin
chmod +x minikube
sudo mv minikube /usr/local/bin/

# Instalar conntrack (requisito para Minikube)
sudo pacman -S conntrack --noconfirm

# Iniciar Minikube usando Docker como controlador
minikube start --driver=docker

# Verificar la instalación
minikube status

echo "Minikube ha sido instalado y configurado correctamente."
echo "Por favor, cierra sesión y vuelve a iniciar sesión o reinicia tu computadora para aplicar los cambios del grupo Docker."

