#/bin/sh
sudo apt-get install lib32z1 lib32ncurses5 p7zip p7zip-full libp11-kit0:i386 libxt6:i386 ocl-icd-libopencl1:i386 odbcinst:i386 odbcinst1debian2:i386 p11-kit-modules:i386 unixodbc:i386 libp11-kit-gnome-keyring:i386
sudo dpkg -i deepin-wine-helper-d/*.deb
sudo dpkg -i deepin-wine-d/*.deb
sudo dpkg -i qq-d/*.deb
sudo apt-get install -f
sudo ldconfig
