{ pkgs, hyprland, inputs, outputs, ... }: {
  home.packages = with pkgs; [ grimblast ];

  programs.wofi.enable = true;

  services.mako = {
    enable = true;
    settings = {
      background-color = "#26233a";
      text-color = "#e0def4";
      border-color = "#524f67";
      progress-color = "over #31748f";
    };
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [ "/home/thechibbis/.wallpaper.png" ];

      wallpaper = [ "HDMI-A-1,/home/thechibbis/.wallpaper.png" ];
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    # set the flake package
    package =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    #portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

    settings = {
      "$mod" = "SUPER";
      "windowrulev2" = "opacity 0.9, class:^(Code)$";

      exec-once = [ "waybar" ];

      general = {
        gaps_in = 2;
        gaps_out = 5;
        border_size = 1;
        "col.active_border" = "rgba(88888888)";
        "col.inactive_border" = "rgba(00000088)";

        allow_tearing = true;
        resize_on_border = true;
      };

      monitor = [
        # "DP-1, preferred, auto-left, auto"
        # "DP-2, preferred, auto-left, auto"
        "HDMI-A-1, 3840x2160@60, auto, auto"
      ];

      input = {
        kb_layout = "br";
        repeat_rate = 50;
        repeat_delay = 200;
      };

      decoration = {
        rounding = 10;
        rounding_power = 3;
        blur = {
          enabled = true;
          brightness = 0.8;
          contrast = 1.0;
          noise = 1.0e-2;

          vibrancy = 0.8;
          vibrancy_darkness = 0.7;

          passes = 2;
          size = 2;

          popups = true;
          popups_ignorealpha = 0.2;
        };

        shadow = {
          enabled = true;
          color = "rgba(00000055)";
          ignore_window = true;
          offset = "0 15";
          range = 100;
          render_power = 2;
          scale = 0.97;
        };
      };

      bind = [
        "$mod SHIFT, E, exec, pkill Hyprland"
        "$mod, Q, killactive,"
        "$mod, F, fullscreen,"
        "$mod, G, togglegroup,"
        "$mod SHIFT, N, changegroupactive, f"
        "$mod SHIFT, P, changegroupactive, b"
        "$mod, R, togglesplit,"
        "$mod, T, togglefloating,"
        "$mod, P, pseudo,"
        "$mod ALT, ,resizeactive,"
        "$mod SHIFT, S, exec, ${pkgs.grimblast}/bin/grimblast copy area"

        "$mod, Return, exec, ghostty"

        "$mod, D, exec, wofi --show drun"
        "$mod, E, exec, zen"
      ] ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (x:
          let
            ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
          in [
            "$mod, ${ws}, workspace, ${toString (x + 1)}"
            "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]) 10));
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];
    };
  };
}
