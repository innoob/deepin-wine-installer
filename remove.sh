#!/bin/sh
sudo dpkg -r libgif4:i386 libgnutls26:i386 libgnutls-deb0-28:i386 libgstreamer0.10-0:i386 libgstreamer-plugins-base0.10-0:i386 libpng16-16:i386 libreadline7:i386
sudo dpkg -r deepin-fonts-wine deepin-libwine:i386 deepin-wine deepin-wine-helper:i386 deepin-wine-uninstaller:i386 deepin-wine32:i386 deepin-wine32-preloader:i386
sudo apt-get autoremove
