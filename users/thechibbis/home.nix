# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs, outputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    inputs.nix-doom-emacs-unstraightened.homeModule
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

      inputs.emacs-overlay.overlays.default

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
      android_sdk.accept_license = true;
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
    foliate
    pavucontrol
    easyeffects
    postman
    libreoffice-qt6
    qbittorrent
    stremio
    calibre
    mpv
    gimp3

    python313Packages.weasyprint
    pkgs.unstable.codex

    nixd
    alejandra
    devenv
    pinentry-gtk2

    vscode-fhs
    zed-editor-fhs
    obsidian
    dbeaver-bin

    bun

    fd
    ripgrep
    gnumake

    inputs.zen-browser.packages.${pkgs.system}.default

    jetbrains-mono
    fira-code

    font-awesome
    inter
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.sauce-code-pro
    nerd-fonts.fantasque-sans-mono

    inputs.nvim-config.packages.${pkgs.system}.nvim

    pkgs.unstable.biome

    gopls
    gomodifytags
    gotests
    gore
    nixfmt
    python3
    black
    isort
    pipenv
    nose2pytest
    rust-analyzer
    shfmt
    shellcheck
    tidyp
    stylelint
    nodejs
    nodePackages.npm
    bun
    cmake
    dockfmt
    clang
    llvm
    libtool
    emacs-lsp-booster
    pandoc
    pkgs.unstable.tailwindcss-language-server
    typescript-language-server
    eslint_d
    prettierd
    eslint
    nodePackages.prettier
    typescript
    vtsls
    (hunspellWithDicts [ hunspellDicts.pt-br hunspellDicts.en-us ])
  ];

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 20;
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

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.git = {
    enable = true;
    userName = "Guilherme Menezes";
    userEmail = "guilhermedeoliveira.menezes@gmail.com";

    signing = {
      key = "0x14CD4D5762BF27F9";
      signByDefault = true;
    };
  };

  programs.obs-studio = {
    enable = true;

    # optional Nvidia hardware acceleration
    package = (pkgs.obs-studio.override { cudaSupport = true; });

    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-vaapi # optional AMD hardware acceleration
      obs-gstreamer
      obs-vkcapture
    ];
  };

  programs.git-credential-oauth.enable = true;

  fonts.fontconfig.enable = true;

  home.file.".wallpaper.png".source = ../../assets/wallpaper.png;
  home.file.".wallpaper.jpg".source = ../../assets/wallpaper.jpg;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
