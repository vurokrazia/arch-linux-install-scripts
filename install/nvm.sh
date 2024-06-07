#!/bin/bash

# Actualizar el sistema
sudo pacman -Syu --noconfirm

# Instalar las dependencias necesarias
sudo pacman -S curl git --noconfirm

# Descargar e instalar nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

# Agregar nvm al perfil de shell
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # Carga nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # Carga nvm bash_completion

# Verificar la instalación de nvm
command -v nvm

# Instalar una versión específica de Node.js (por ejemplo, la última versión LTS)
nvm install --lts

# Verificar la instalación de Node.js y npm
node -v
npm -v

echo "nvm, Node.js y npm se han instalado correctamente."
