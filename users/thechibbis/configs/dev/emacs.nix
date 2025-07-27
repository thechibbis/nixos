{ pkgs, inputs, ... }:

{
  services.emacs = {
    enable = true;
    package = pkgs.emacs-custom;
  };
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-custom;
  };
}
