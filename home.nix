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

   programs.git = {
     enable = true;
     userName = "Johannes Melsbach";
     userEmail = "me@melsbach.dev";
   };
  programs.zsh = {
  enable = true;
  enableCompletion = true;
  enableAutosuggestions = true;
  enableSyntaxHighlighting = true;

  "oh-my-zsh" = {
    enable = true;
    theme = "robbyrussell";
    plugins = [ "git" "docker" ];
  };

  shellAliases = {
    ll = "ls -lah";
    gs = "git status";
  };
};
}
