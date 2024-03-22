# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
        ];

# Bootloader.
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/nvme0n1";
    boot.loader.grub.useOSProber = true;
    boot.supportedFilesystems=["ntfs"];

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

# Configure console keymap
    console.keyMap = "dk";

# Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.chris = {
        isNormalUser = true;
        description = "chris";
        extraGroups = [ "networkmanager" "wheel" "video" "plugdev" "dialout"];
        packages = with pkgs; [];
    };

# List packages installed in system profile. To search, run:
# $ nix search wget
#nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
        vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
            neovim
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
            openconnect
            libreoffice
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
            skim
            feh
            openssh
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
            rtl-sdr
            sdrangel
            gqrx
            ripgrep
            wl-clipboard
            grim
            slurp
            jq
            htop
            gnome.adwaita-icon-theme
            gpredict
            dunst
            libnotify
            mpv
            libreoffice-fresh
            signal-desktop
            net-snmp
            remmina
            pv
            ];


    fonts.packages = with pkgs; [
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
    nixpkgs.overlays = [
        (self: super: {
         dwl = super.dwl.overrideAttrs (oa: {
                 patches = [
                 /home/chris/dotfiles/dwl/patches/autostart.patch 
                 /home/chris/dotfiles/dwl/patches/pertag.patch
                 ];
                 conf = /home/chris/dotfiles/dwl/config.def.h;
                 });
         })
    ];


    programs.zsh.enable = true;
    programs.light.enable = true;

    programs.firefox = {
        enable = true;
        preferences = {
            "widget.use-xdg-desktop-portal.file-picker" = 0;
        };
    };

    users.defaultUserShell = pkgs.zsh;
    system.stateVersion = "23.11"; 
    security.polkit.enable = true;
    security.pam.services.swaylock = {};

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
    };



    xdg.portal = {
        enable = true;
        config.common.default = "*";
        extraPortals = with pkgs; [
            xdg-desktop-portal-wlr
                xdg-desktop-portal-gtk
        ];
        wlr.enable = true;
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
