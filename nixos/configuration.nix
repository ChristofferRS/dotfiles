# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
        ];
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    # Bootloader.
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/nvme0n1";
    boot.loader.grub.useOSProber = true;
    boot.supportedFilesystems=["ntfs"];
    fileSystems."/mnt/share" = {
    device = "//wfilnuk1/common";
    fsType = "cifs";
    options = let
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s,user,users";
      in ["${automount_opts},credentials=/etc/nixos/smb-secrets,uid=1000,gid=100"];
  };

    networking.hostName = "nixos"; # Define your hostname.
    networking.networkmanager.enable = true;

# Set your time zone.
    time.timeZone = "America/Nuuk";

# Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";


    services.blueman.enable = true;

    services.dbus.enable = true;

# Printing
    services.printing.enable = true;
    services.printing.drivers = [ pkgs.hplip ];
    services.avahi = {
        enable = true;
        nssmdns = true;
        openFirewall = true;
    };

    hardware.rtl-sdr.enable = true;
    services.udev.packages = [ pkgs.rtl-sdr ];

# rtkit is optional but recommended
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };

    services.syncthing = {
        enable = true;
        user = "chris";
        configDir = "/home/chris/.config/syncthing";
        overrideDevices = true;     # overrides any devices added or deleted through the WebUI
        overrideFolders = true;     # overrides any folders added or deleted through the WebUI
        settings = {
            devices = {
                "Zenfone" = { id = "75P3HEP-FNZOOIG-K4D32FY-VFDKWSI-BO2CDRD-JXBBDVV-ZI3PWHS-DDUK5QB"; };
                "T480s" = { id = "DTE23NQ-YW6UNNZ-L2EUW3D-SZSWPZT-BOBGDL5-UVEH2RN-XRK2ZOO-BMZCTQK"; };
            };
            folders = {
                "Obsidian-Vault" = {         # Name of folder in Syncthing, also the folder ID
                path = "/home/chris/Documents/Vault";    # Which folder to add to Syncthing
                devices = [ "Zenfone" "T480s"];      # Which devices to share the folder with
                };
            };
        };
    };

# Configure console keymap
    console.keyMap = "dk";

# Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.chris = {
        isNormalUser = true;
        description = "chris";
        extraGroups = [ "networkmanager" "wheel" "video" "plugdev" "dialout" "adbusers"];
        packages = with pkgs; [];
    };

    environment.sessionVariables = {
        XDG_CURRENT_DESKTOP = "sway"; 
    };


# List packages installed in system profile. To search, run:
# $ nix search wget
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
        vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
            (pkgs.wrapFirefox (pkgs.firefox-unwrapped.override { pipewireSupport = true;}) {})
            neovim
            tree-sitter
            nodejs
            transmission_4-gtk
            wget
            chromium
            polkit
            git
            bemenu
            poppler_utils
            acpi
            wbg
            gnumake
            tmux
            networkmanager-openconnect
            networkmanagerapplet
            openconnect
            webkitgtk
            alacritty
            stow
            ripgrep
            fd
            nnn
            zsh-syntax-highlighting
            zathura
            pamixer
            pulsemixer
            iperf
            fzf
            feh
            openssh
            gnupg
            file
            swaybg
            swaylock
            river
            yambar
            unzip
            kanshi
            wlr-randr
            bluez
            xdg-utils
            texliveFull
            nsxiv
            inkscape
            libusb
            ripgrep
            wl-clipboard
            grim
            slurp
            jq
            conda
            gnuplot
            pandoc
            htop
            gnome.adwaita-icon-theme
            gpredict
            dunst
            libnotify
            mpv
            signal-desktop
            net-snmp
            remmina
            pv
            gcc
            zip
            go
            cifs-utils
            pinentry
            libreoffice
            obsidian
            ];

    fonts = {
        fontconfig = {
            enable = true;
            defaultFonts = {
                serif = [  "Linux Libertine Serif" ];
                sansSerif = [ "Linux Libertine Sans" ];
                monospace = [ "Linux Libertine Mono" ];
            };
        };
        packages = with pkgs; [
            libertine
                noto-fonts
                noto-fonts-cjk
                noto-fonts-emoji
                liberation_ttf
                fira-code
                fira-code-symbols
                mplus-outline-fonts.githubRelease
                dina-font
                proggyfonts
                nerdfonts
        ];
    };

    programs.zsh.enable = true;
    programs.light.enable = true;
    programs.adb.enable = true;
    programs.gnupg.agent.enable = true;

    users.defaultUserShell = pkgs.zsh;
    system.stateVersion = "23.11"; 
    security.polkit.enable = true;
    security.pam.services.swaylock = {};
    services.gnome.gnome-keyring.enable = true;

    xdg.mime.defaultApplications = {
        "application/pdf" = "org.pwmt.zathura.desktop";
        "image/png" = "nsxiv.desktop";
        "image/jpg" = "nsxiv.desktop";
        "image/jpeg" = "nsxiv.desktop";
        "x-scheme-handler/lbry" = "lbry.desktop";
        "x-scheme-handler/magnet" = "torrent.desktop;";
        "application/x-bittorrent" = "torrent.desktop;";
        "application/gzip" = "xournalpp.desktop";
        "text/html" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/about" = "firefox.desktop";
        "x-scheme-handler/unknown" = "firefox.desktop";
        "ringtone.opus" = "mpv.desktop";
        "audio/x-opus+ogg" = "mpv.desktop";
        "x-scheme-handler/prusaslicer" = "PrusaSlicerURLProtocol.desktop";
        "application/vnd.ms-visio.drawing.main+xml" = "draw.desktop";
    };



    xdg.portal = {
        enable = true;
        config.common.default = "*";
        extraPortals = with pkgs; [
            xdg-desktop-portal-wlr
                xdg-desktop-portal-gtk
        ];
    };

    security.sudo = {
        enable = true;
        extraRules = [{
            commands = [
            {
                command = "${pkgs.systemd}/bin/systemctl suspend";
                options = [ "NOPASSWD" ];
            }
            {
                command = "${pkgs.systemd}/bin/reboot";
                options = [ "NOPASSWD" ];
            }
            {
                command = "${pkgs.systemd}/bin/poweroff";
                options = [ "NOPASSWD" ];
            }
            {
                command = "/run/wrappers/bin/mount";
                options = [ "NOPASSWD" ];
            }
            {
                command = "/run/wrappers/bin/umount";
                options = [ "NOPASSWD" ];
            }
            ];
            groups = [ "wheel" ];
        }];
    };

}
