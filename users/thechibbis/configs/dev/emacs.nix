{ pkgs, inputs, ... }:
{
  services.emacs.enable = true;
  programs.doom-emacs = {
    enable = true;
    doomDir = ./doom.d;
    extraPackages = epkgs: [
      epkgs.vterm
      epkgs.treesit-grammars.with-all-grammars

      pkgs.ispell
      pkgs.rust-analyzer
      pkgs.gopls
      pkgs.nil
      pkgs.nixfmt
      pkgs.yaml-language-server
    ];
  };
}
