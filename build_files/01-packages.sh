#!/bin/bash

set -ouex pipefail

# For chrome and other packages that may install to /opt
ln -s /var/opt /opt

PKGS=(
    # Hardware support
    @hardware-support

    # Swap on ZRAM
    zram-generator-defaults

    # Audio support
    pipewire
    wireplumber

    # Multimedia, hardware acceleration and codecs
    ffmpeg
    libva-intel-driver
    @multimedia

    # Needed for homebrew, git and some more
    @development-tools 
    
    # CLI tools
    distrobox
    ddcutil
    micro
    wl-clipboard # Needed for micro

    # Graphical Interface
    sddm
    plasma-desktop
    plasma-nm
    plasma-pa
    @fonts

    # Plasma addons, for sticky notes
    kdeplasma-addons
    
    # Theming for consistency
    sddm-breeze
    breeze-gtk

    # Graphical tools
    dolphin
    spectacle
    konsole
    code
    chromium

    # Flatpaks
    flatpak
    plasma-discover
    plasma-discover-flatpak
    plasma-discover-kns # Not flatpak related but its discover related so it's here
)

dnf5 -y in --setopt="install_weak_deps=False" "${PKGS[@]}"

### From ublue main:
# mitigate upstream packaging bug: https://bugzilla.redhat.com/show_bug.cgi?id=2332429
# swap the incorrectly installed OpenCL-ICD-Loader for ocl-icd, the expected package

dnf5 -y swap --repo='fedora' OpenCL-ICD-Loader ocl-icd