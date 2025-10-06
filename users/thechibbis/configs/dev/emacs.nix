{ pkgs, config, ... }: {
  programs.doom-emacs = {
    enable = true;
    doomDir = ./doom.d; # or e.g. `./doom.d` for a local configuration

    emacs = pkgs.emacs-pgtk;

    extraBinPackages = with pkgs; [
      git
      ripgrep
      fd
      tailwindcss-language-server
      typescript-language-server
      eslint_d
      prettierd
      rustywind
    ];

    extraPackages = epkgs: [ epkgs.treesit-grammars.with-all-grammars ];
  };
}

