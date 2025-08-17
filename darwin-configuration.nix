# /etc/nix-darwin/darwin-configuration.nix
{ config, pkgs, ... }:

{
  users.users.johannes = {
  home = "/Users/johannes";
  shell = pkgs.zsh; # optional, but nice to set
};

  ids.gids.nixbld = 350;

  #nix.enable = false; # For Determinate Systems installer
  networking.hostName = "m1-max";
  system.primaryUser = "johannes";


  # System-wide packages, available to all users.
  environment.systemPackages = [
    pkgs.aerospace
    pkgs.
    pkgs.docker
    pkgs.gh
    pkgs.htop
    pkgs.neofetch
    pkgs.neovim
    pkgs.oh-my-zsh
    pkgs.stow
    pkgs.tmux
    pkgs.uv
    pkgs.wget
    pkgs.git
      ];


  # Homebrew integration is a system-level feature
  homebrew = {
    enable = true;
    casks = [
      "affinity-designer"
      "affinity-photo" "affinity-publisher"
      "aldente"
      "anki"
      "discord"
      "hiddenbar"
      "homerow"
      "logi-options+"
      "iterm2"
      "logseq"
      "obs"
      "proton-mail-bridge"
      "proton-pass"
      "protonvpn"
      "slack"
      "spotify"
      "raycast"
      "zed"
      "zen"
      "zotero@beta"
      "font-jetbrains-mono-nerd-font"
    ];
    brews = [ "mas" ];
    masApps = {
      "Klack" = 6446206067;
      "MoneyMoney" = 872698314;
      "PDF Expert" = 1055273043;
      "Pixelmator Pro" = 1289583905;
      "ProtonPass for Safari" = 6502835663;
    };
  };

  time.timeZone = "Europe/Berlin";
  system.stateVersion = 4;

}
