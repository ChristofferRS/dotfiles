{ config, pkgs, ... }:
{
    system.stateVersion = "23.11";
    imports =
        [ 
        ./hardware-configuration.nix
        ];
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/nvme0n1";
    boot.loader.grub.useOSProber = false;
    boot.supportedFilesystems=["ntfs"];
    boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
    networking.hostName = "nixos"; # Define your hostname.
    networking.networkmanager.enable = true;

    time.timeZone = "Europe/Copenhagen";
    i18n.defaultLocale = "en_GB.UTF-8";

    services.blueman.enable = true;
    services.dbus.enable = true;

    services.printing.enable = true;
    services.printing.drivers = [ pkgs.hplip ];
    services.avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
    };

    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };

    console.keyMap = "dk";

    users.users.chris = {
        isNormalUser = true;
        description = "chris";
        extraGroups = [ "networkmanager" "wheel" "video" "plugdev" "dialout" "adbusers"];
        packages = with pkgs; [];
    };

    environment.sessionVariables = {
        XDG_CURRENT_DESKTOP = "sway"; 
    };


    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
            (firefox.override { nativeMessagingHosts = [passff-host]; })
            neovim
            pass
            pinentry-gtk2
            tree-sitter
            transmission_4-gtk
            wget
            polkit
            git
            bemenu
            acpi
            wbg
            tmux
            openconnect
            alacritty
            stow
            ripgrep
            fd
            nnn
            zathura
            pamixer
            pulsemixer
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
            libusb1
            ripgrep
            wl-clipboard
            grim
            slurp
            jq
            pandoc
            htop
            adwaita-icon-theme
            dunst
            libnotify
            mpv
            signal-desktop
            zip
            cifs-utils
            pinentry
            obsidian
            ];

    nixpkgs.config.joypixels.acceptLicense = true;
    fonts = {
        fontconfig = {
            enable = true;
            defaultFonts = {
                serif =     [  "Liberation Serif" ];
                sansSerif = [ "Ubuntu" ];
                monospace = [ "Ubuntu Mono" ];
            };
        };
        packages = with pkgs; [
            nerd-fonts.symbols-only
            noto-fonts
            noto-fonts-emoji
            ubuntu_font_family
            libertine
            liberation_ttf
            joypixels
        ];
    };

    programs.zsh.enable = true;
    programs.zsh.syntaxHighlighting.enable = true;
    programs.light.enable = true;

    programs.gnupg.agent = {
        enable = true;
        pinentryPackage = pkgs.pinentry-gtk2;
    };

    users.defaultUserShell = pkgs.zsh;
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
