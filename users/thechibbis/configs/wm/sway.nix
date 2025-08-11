{
  pkgs,
  config,
  lib,
  ...
}: {
  services.mako = {
    enable = true;
    settings = {
      background-color = "#26233a";
      text-color = "#e0def4";
      border-color = "#524f67";
      progress-color = "over #31748f";
    };
  };

  wayland.windowManager.sway = {
    enable = true;
    extraOptions = ["--unsupported-gpu"];
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      # needs qt5.qtwayland in systemPackages
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      export _JAVA_AWT_WM_NONREPARENTING=1
    '';

    config = rec {
      modifier = "Mod4";
      terminal = "ghostty";

      output = {
        HDMI-A-1 = {
          resolution = "3840x2160@60hz";
        };
      };

      input."*" = {
        xkb_layout = "br";
      };

      window = {
        titlebar = false;
        border = 1;
      };

      bars = [
        {
          fonts = {
            names = ["JetBrains Mono"];
            size = 7.0;
          };
          statusCommand = "${pkgs.i3status}/bin/i3status";
         }
      ];

      keybindings = let
        modifier = config.wayland.windowManager.sway.config.modifier;
      in
        lib.mkOptionDefault {
          "${modifier}+q" = "kill";
          "${modifier}+Shift+s" = "exec ${pkgs.sway-contrib.grimshot}/bin/grimshot copy area";
        };
    };
  };
}
