#!/bin/bash
# Installation des dépendances pour Oricutron

echo "=== Installation des dépendances pour Oricutron ==="

if [ -f /etc/debian_version ]; then
    echo "Distribution Debian/Ubuntu détectée"
    sudo apt update
    sudo apt install -y cmake build-essential libsdl2-dev libgtk-3-dev pkg-config

elif [ -f /etc/fedora-release ]; then
    echo "Distribution Fedora détectée"
    sudo dnf install -y cmake gcc-c++ SDL2-devel gtk3-devel pkg-config

elif [ -f /etc/arch-release ]; then
    echo "Distribution Arch Linux détectée"
    sudo pacman -S cmake base-devel sdl2 gtk3 pkg-config

elif [ -f /etc/opensuse-release ]; then
    echo "Distribution openSUSE détectée"
    sudo zypper install -y cmake gcc-c++ libSDL2-devel gtk3-devel pkg-config

else
    echo "Distribution non reconnue"
    echo "Veuillez installer manuellement : cmake, gcc, SDL2, GTK+3, pkg-config"
    exit 1
fi

echo ""
echo "=== Dépendances installées ==="
echo "Pour compiler :"
echo "  mkdir build && cd build"
echo "  cmake .. && make -j\$(nproc)"
