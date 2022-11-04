#MINIMAL PACKAGES FOR BUDGIE
BUDGIE=(
\@base-x
\budgie-desktop
\gnome-terminal
\nautilus
\gnome-text-editor
\gnome-system-monitor
\gnome-terminal-nautilus
\xdg-user-dirs-gtk
\lightdm-gtk
\@'Hardware Support'
\@Fonts
\@Multimedia
)
#MINIMAL PACKAGES FOR GNOME
GNOME=(
\@base-x
\gdm
\gnome-connections
\gnome-control-center
\gnome-initial-setup
\gnome-session-wayland-session
\gnome-session-xsession
\gnome-settings-daemon
\gnome-shell
\gnome-software
\gnome-terminal
\gnome-text-editor
\nautilus
\evince
\fprintd-pam
\glib-networking
\gnome-backgrounds
\gnome-bluetooth
\gnome-browser-connector
\gnome-characters
\gnome-clocks
\gnome-color-manager
\gnome-disk-utility
\gnome-font-viewer
\gnome-logs
\gnome-remote-desktop
\gnome-system-monitor
\gnome-terminal-nautilus
\gnome-themes-extra
\gnome-user-share
\gnome-weather
\gnome-tweaks
\gvfs-afc
\gvfs-afp
\gvfs-archive
\gvfs-goa
\gvfs-gphoto2
\gvfs-mtp
\gvfs-smb
\NetworkManager-adsl
\NetworkManager-openconnect-gnome
\NetworkManager-openvpn-gnome
\NetworkManager-ppp
\NetworkManager-pptp-gnome
\NetworkManager-ssh-gnome
\NetworkManager-vpnc-gnome
\PackageKit-command-not-found
\PackageKit-gtk3-module
\xdg-desktop-portal
\xdg-desktop-portal-gtk
\xdg-desktop-portal-gnome
\xdg-user-dirs-gtk
\libcanberra-gtk3
\libproxy-duktape
\librsvg2
\libsane-hpaio
\orca
\systemd-oomd-defaults
\sushi
\rygel
\tracker
\tracker-miners
\eog
\@Fonts
\@Multimedia
\@'Hardware Support'
)
#MINIMAL PACKAGES FOR KDE PLASMA
PLASMA=(
\@base-x
\bluedevil
\breeze-gtk
\plasma-discover
\plasma-drkonqi
\kde-gtk-config
\kdeplasma-addons
\kgamma
\khotkeys
\kinfocenter
\kscreen
\ksshaskpass
\pam-kwallet
\kwayland-integration
\kwrited
\plasma-browser-integration
\plasma-desktop
\plasma-disks
\plasma-firewall
\plasma-nm
\plasma-pa
\plasma-systemmonitor
\plasma-thunderbolt
\plasma-vault
\plasma-workspace-wallpapers
\powerdevil
\sddm
\sddm-kcm
\sddm-breeze
\xdg-desktop-portal-kde
\konsole
\kwrite
\dolphin
\ark
\kde-partitionmanager
\plasma-workspace-wayland
\egl-wayland
\@'Hardware Support'
\@Multimedia
\@Fonts
)
while [ "$1" != "" ];
 do 
    case "$1" in
    -b | --budgie | budgie)dnf install "${BUDGIE[@]}"
       systemctl set-default graphical.target
     exit 1
     ;;
    -g | --gnome | gnome)dnf install "${GNOME[@]}"
      systemctl set-default graphical.target
    exit 1
    ;;
    -p | --plasma | plasma)dnf install "${PLASMA[@]}"
      systemctl set-default graphical.target
    exit 1
    ;;
    *)echo "Usage: sudo bash $(basename /$0) [OPTIONS...]
    
       -b, --budgie, budgie
      Installs BUDGIE
       
       -g, --gnome, gnome
      Installs GNOME
      
       -p, --plasma, plasma
      Installs KDE PLASMA
      "  
    exit 1
    ;;
    
    esac
  done

