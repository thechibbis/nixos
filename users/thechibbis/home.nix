# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    inputs.nvim-config.homeModules.default

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    ./configs
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "thechibbis";
    homeDirectory = "/home/thechibbis";
  };

  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [
    discord
    spotify
    whatsapp-for-linux
    mupdf
    notion-app-enhanced
    pavucontrol

    inputs.nvim-config.packages.${pkgs.system}.nvim
    nixd
    nil
    niv
    alejandra

    inputs.zen-browser.packages.${pkgs.system}.default

    wl-clipboard

    jetbrains-mono
    fira-code

    font-awesome
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
  ];

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 13;
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "Guilherme Menezes";
    userEmail = "guilhermedeoliveira.menezes@gmail.com";
  };

  fonts.fontconfig.enable = true;

  home.file.".bay.JPG".source = ../../assets/bay.JPG;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
