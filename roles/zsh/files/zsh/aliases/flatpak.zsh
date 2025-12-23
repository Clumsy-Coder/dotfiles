#!/usr/bin/env zsh

# exit if flatpak is not installed
if [ ! -x "$(command -v flatpak)" ]; then
  return
fi

alias android-studio="flatpak run com.google.AndroidStudio"
alias calibre="flatpak run com.calibre_ebook.calibre"
alias code="flatpak run com.visualstudio.code"
alias discord="flatpak run com.discordapp.Discord"
alias flatseal="flatpak run com.github.tchx84.Flatseal"
alias codium="flatpak run com.vscodium.codium"
alias prusa="flatpak run com.prusa3d.PrusaSlicer"
alias flameshot="flatpak run org.flameshot.Flameshot"
alias ghidra="flatpak run org.ghidra_sre.Ghidra"
alias gnome-extensions="flatpak run org.gnome.Extensions"
alias ipscan="flatpak run org.angryip.ipscan"
alias kiwix="flatpak run org.kiwix.desktop"
alias localsend="flatpak run org.localsend.localsend_app"
alias missioncenter="flatpak run io.missioncenter.MissionCenter"
alias obsidian="flatpak run md.obsidian.Obsidian"
alias pika-backup="flatpak run org.gnome.World.PikaBackup"
alias piper="flatpak run org.freedesktop.Piper"
alias postman="flatpak run com.getpostman.Postman"
alias qbittorrent="flatpak run org.qbittorrent.qBittorrent"
alias rhythmbox="flatpak run org.gnome.Rhythmbox3"
alias rpi-imager="flatpak run org.raspberrypi.rpi-imager"
alias signal="flatpak run org.signal.Signal"
alias solaar="flatpak run io.github.pwr_solaar.solaar"
alias spotify="flatpak run com.spotify.Client"
alias dconf-editor="flatpak run ca.desrt.dconf-editor"
alias subl="flatpak run com.sublimetext.three"
alias vlc="flatpak run org.videolan.VLC"
alias warehouse="flatpak run io.github.flattool.Warehouse"
alias wireshark="flatpak run org.wireshark.Wireshark"
