# /ietc/nix-darwin/darwin-configuration.nix
{ config, pkgs, ... }:

{
  # This is the crucial fix for the Determinate Installer conflict.
  nix.enable = false;
  networking.hostName = "m1-max";
  # List packages you want to install in your system profile.
  system.primaryUser = "johannes";
  # install xcode developer tools
  system.activationScripts.postActivation.text = ''
    # Show a GUI prompt if the tools are not installed.
    /usr/bin/xcode-select --install >/dev/null 2>&1 || true
  '';


  environment.systemPackages = [
    pkgs.docker
    pkgs.gh
    pkgs.git
    pkgs.htop
    pkgs.neofetch
    pkgs.neovim
    pkgs.tmux
    pkgs.uv
    pkgs.wget
  ];
  
  programs.git = {
    enable = true;
    userName = "Johannes Melsbach";
    userEmail = "dev@melsbach.org";
    extraConfig = {
     core.editor = "nvim";
    };
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
  
  # iTerm2 Configuration
  programs.iterm2 = {
    enable = true;
    settings = {
      "Normal Font" = "JetBrainsMonoNLNerdFontComplete-Regular 14";
      "Non-ASCII Font" = "JetBrainsMonoNLNerdFontComplete-Regular 14";
    };
  };


  homebrew = {
    enable = true;

    # A list of casks (GUI applications) to install.
    casks = [
      "aerospace"
      "affinity-designer"
      "affinity-photo"
      "affinity-publisher"
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
      # fonts
      "font-jetbrains-mono-nerd-font"
    ];

    # A list of brews (command-line tools) to install.
    # Use this for tools not in Nixpkgs or when the Homebrew
    # version is preferred.
    brews = [
      "mas" # A CLI for the Mac App Store
    ];
    
    masApps = {
      "Klack" = 6446206067;
      "MoneyMoney" = 872698314;
      "PDF Expert" = 1055273043;
      "Pixelmator Pro" = 1289583905;
    };
    


    # Optional: A list of taps (third-party repositories) to add.
    # This is commented out, but shown as an example.
    # taps = [
    #   "homebrew/services"
    # ];
  };
  # Set your system's time zone.
  time.timeZone = "Europe/Berlin";

  # Used for backwards compatibility, do not change.
  system.stateVersion = 4;
}
