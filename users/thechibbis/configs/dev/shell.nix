{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  programs.bash = {
    enable = true;
    shellAliases = {
      nxr = "sudo nixos-rebuild switch --flake $HOME/dev/nixos#desktop";
      hmr = "home-manager switch --flake $HOME/dev/nixos#archwsl";
      rn = "nix flake init --template github:the-nix-way/dev-templates#rust-toolchain";
    };
    initExtra = ''
      eval "$(starship init bash)"
    '';
    bashrcExtra = ''
      export PATH="$PATH:$HOME/.local/bin:$HOME/.npm-global/bin"
    '';
  };
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

  services.lorri.enable = true;
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      themes = {
        rose-pine = {
          "bg" = "#403d52";
          "fg" = "#e0def4";
          "red" = "#eb6f92";
          "green" = "#31748f";
          "blue" = "#9ccfd8";
          "yellow" = "#f6c177";
          "magenta" = "#c4a7e7";
          "orange" = "#fe640b";
          "cyan" = "#ebbcba";
          "black" = "#26233a";
          "white" = "#e0def4";
        };
      };

      default_layout = "compact";
      pane_frames = false;

      ui = {
        pane_frames = {
          rounded_corners = true;
        };
      };

      theme = "rose-pine";
    };
  };
}
