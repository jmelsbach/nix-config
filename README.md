# macOS configuration 

This repository contains my personal macOS configuration, managed with [Nix](https://nixos.org/), [Nix-Darwin](https://github.com/LnL7/nix-darwin), and [Home Manager](https://github.com/nix-community/home-manager).

Using Nix Flakes, this setup ensures a reproducible, declarative, and version-controlled system environment.

## Prerequisites

Before you can use this configuration, you must have a working Nix installation on your macOS machine.

1.  **Install Nix:** Follow the [official installation guide](https://nixos.org/download.html) to install the Nix package manager. The recommended multi-user installation is preferred.

2.  **Enable Flakes:** Nix Flakes are a core part of this setup. You need to enable them by editing your Nix configuration file.

    Open `/etc/nix/nix.conf` with root privileges (e.g., `sudo nano /etc/nix/nix.conf`) and add the following lines:

    ```
    experimental-features = nix-command flakes
    extra-substituters = https://cache.nixos.org/
    extra-trusted-public-keys = cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=
    ```

## Installation

### Fresh Installation on a New Machine

This method is for provisioning a new Mac. It installs the configuration directly from this GitHub repository. **Note:** This command requires `sudo` because `nix-darwin` modifies system files.

```sh
sudo nix run nix-darwin -- switch --flake github:jmelsbach/nix-config#m1-max
```
