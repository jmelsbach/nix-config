# /etc/nix-darwin/darwin-configuration.nix
{ config, pkgs, ... }:

{

  #nix.enable = false; # For Determinate Systems installer
  networking.hostName = "m1-max";
  system.primaryUser = "johannes";

  # install xcode developer tools
  system.activationScripts.postActivation.text = ''
    # Show a GUI prompt if the tools are not installed.
    /usr/bin/xcode-select --install >/dev/null 2>&1 || true
  '';

  # System-wide packages, available to all users.
  environment.systemPackages = [
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
      "proton-mail-bridge"
      "proton-pass"
      "protonvpn"
      "slack"
      "spotify"
      "raycast"
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
