#MINIMAL PACKAGES FOR BUDGIE
BUDGIE=(
\@base-x
\budgie-desktop
\gnome-console
\nautilus
\gnome-text-editor
\gnome-system-monitor
\xdg-user-dirs-gtk
#Normal SDDM will have touchscreen keyboard pop up.
\materia-kde-sddm
\desktop-backgrounds-compat
\gvfs-afc
\gvfs-afp
\gvfs-archive
\gvfs-goa
\gvfs-gphoto2
\gvfs-mtp
\gvfs-smb
\evince
\gnome-disk-utility
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
\gnome-console
\gnome-text-editor
\nautilus
\evince
\fprintd-pam
\glib-networking
\desktop-backgrounds-gnome
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
#Packages for Wayfire with a minimal amount of GNOME apps.
WAYFIRE_GTK=(
\wayfire
\xorg-11-server-Xwayland
\xdg-desktop-portal-wlr
\wapanel
\gnome-text-editor
\gnome-disk-utility
\nautilus
\gnome-console
\gvfs-afc
\gvfs-afp
\gvfs-archive
\gvfs-goa
\gvfs-gphoto2
\gvfs-mtp
\gvfs-smb
\xdg-user-dirs-gtk
#LightDM has problems with Wayland.
materia-kde-sddm
@Multimedia
@'Hardware Support'
)
#Packages for Wayfire with a minimal amount of KDE apps
WAYFIRE_QT=(
\wayfire
\xorg-x11-server-Xwayland
\xdg-desktop-portal-wlr
\wapanel
\kwrite
\kde-partitionmanager
\dolphin
\ark
\konsole
\materia-kde-sddm
\@Multimedia
\@'Hardware Support'
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
    -wg | --wayfire-gtk | wayfire-gtk)dnf install "${WAYFIRE_GTK[@]}"
      mv $PWD/wayfire.ini -t $HOME/.config/
      mv $PWD/wf-shell.ini -t $HOME/.config/
      mkdir $HOME/.config/wapanel
      mv $PWD/wayfire-gtk/wapanel.toml -t $HOME/.config/wapanel
      systemctl set-default graphical.target
      exit 1
      ;;
         -wq | --wayfire-qt| wayfire-qt)dnf install "${WAYFIRE_QT[@]}"
      mv $PWD/wayfire.ini -t $HOME/.config/
      mv $PWD/wf-shell.ini -t $HOME/.config/
      mkdir $HOME/.config/wapanel
      mv $PWD/wayfire-qt/wapanel.toml -t $HOME/.config/wapanel
      systemctl set-default graphical.target
      exit 1
      ;;
    *)echo "Usage: sudo bash $(basename /$0) [OPTIONS...]
    
       -b, --budgie, budgie
      Installs Budgie
       
       -g, --gnome, gnome
      Installs GNOME
      
       -p, --plasma, plasma
      Installs KDE Plasma
      
       -wg, --wayfire-gtk, wayfire-gtk
      Installs Wayfire with some GNOME apps
      
        -wq, --wayfire-qt, wayfire-qt
      Installs Wayfire with some KDE Plasma apps.
      "  
    exit 1
    ;;
    
    esac
  done

