# ~/.config/nix-config/home.nix
{ pkgs, ... }:

{
  # Home Manager state version
  home.stateVersion = "24.05"; # Or your desired version
   home.homeDirectory = "/Users/johannes";  # Explicitly set to override defaults


  # Your user-specific packages that were here before
  home.packages = [
    pkgs.aerospace
    pkgs.docker
    pkgs.gh
    pkgs.htop
    pkgs.neofetch
    pkgs.neovim
    pkgs.oh-my-zsh
    pkgs.tmux
    pkgs.uv
    pkgs.wget
    pkgs.git
  ];

  # This is crucial for Home Manager to manage itself
  programs.home-manager.enable = true;

  # You can add all future user-specific config here
  # For example:
  # programs.git = {
  #   enable = true;
  #   userName = "Johannes";
  #   userEmail = "your@email.com";
  # };
}
