# /etc/nix-darwin/darwin-configuration.nix
{ config, pkgs, ... }:

{
  # -------------------------------------------------------------------
  # System-Level Configuration (managed by nix-darwin)
  # -------------------------------------------------------------------

  nix.enable = false; # For Determinate Systems installer
  networking.hostName = "m1-max";
  system.primaryUser = "johannes";

  # install xcode developer tools
  system.activationScripts.postActivation.text = ''
    # Show a GUI prompt if the tools are not installed.
    /usr/bin/xcode-select --install >/dev/null 2>&1 || true
  '';

  # System-wide packages, available to all users.
  environment.systemPackages = [
    pkgs.docker
    pkgs.gh
    pkgs.htop
    pkgs.neofetch
    pkgs.tmux
    pkgs.uv
    pkgs.wget
    # Note: git is already managed by home-manager below, but having it
    # here is fine too if you want it to be system-wide.
    pkgs.git
  ];

  # System-wide configuration for iTerm2
  programs.iterm2 = {
    enable = true;
    settings = {
      "Normal Font" = "JetBrainsMonoNLNerdFontComplete-Regular 14";
      "Non-ASCII Font" = "JetBrainsMonoNLNerdFontComplete-Regular 14";
    };
  };

  # Homebrew integration is a system-level feature
  homebrew = {
    enable = true;
    casks = [
      "aerospace"
      "affinity-designer"
      "affinity-photo" "affinity-publisher"
      "aldente"
      "anki"
      "discord"
      "hiddenbar"
      "homerow"
      "iterm2"
      "logseq"
      "oh-my-zsh"
      "proton-mail-bridge"
      "proton-pass"
      "protonvpn"
      "slack"
      "spotify"
      "raycast"
      "zotero@beta"
      "font-jetbrains-mono-nerd-font"
    ];
    brews = [ "mas" ];
    masApps = {
      "Klack" = 6446206067;
      "MoneyMoney" = 872698314;
      "PDF Expert" = 1055273043;
      "Pixelmator Pro" = 1289583905;
    };
  };

  time.timeZone = "Europe/Berlin";
  system.stateVersion = 4;

  # -------------------------------------------------------------------
  # User-Level Configuration (managed by Home Manager)
  # -------------------------------------------------------------------
  home-manager.users.johannes = {
    # Home Manager needs a state version, similar to system.stateVersion
    home.stateVersion = "23.11"; # or your current Nixpkgs version

    programs.git = {
      enable = true;
      userName = "Johannes Melsbach";
      userEmail = "dev@melsbach.org";
      extraConfig = {
        core.editor = "nvim";
      };
    };

    programs.zsh = {
      enable = true;
      shellAliases = {
        ".." = "cd ..";
        ll = "ls -alh";
        gs = "git status";
      };
      env = {
        EDITOR = "nvim";
      };
      initExtra = ''
        neofetch
      '';
    };

    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      extraConfig = ''
        set number
        set mouse=a
      '';
    };
  };
}
