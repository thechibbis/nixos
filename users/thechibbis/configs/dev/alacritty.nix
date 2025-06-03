{pkgs, ...}: {
  programs.kitty = {
    enable = true;

    font.name = "JetBrains Mono";
    font.size = 9.0;

    shellIntegration.enableBashIntegration = true;

    settings = {
      background_opacity = 0.6;
    };
  };
  programs.alacritty = {
    enable = true;

    settings = {
      general = {
        live_config_reload = true;
      };

      window = {
        opacity = 0.9;
      };

      font = {
        normal = {
          family = "JetBrains Mono";
          style = "Regular";
        };

        bold = {
          family = "JetBrains Mono";
          style = "Bold";
        };

        italic = {
          family = "JetBrains Mono";
          style = "Italic";
        };

        bold_italic = {
          family = "JetBrains Mono";
          style = "Bold Italic";
        };

        size = 11.0;
      };

      colors = {
        primary = {
          foreground = "#e0def4";
          background = "#191724";
          dim_foreground = "#908caa";
          bright_foreground = "#e0def4";
        };

        cursor = {
          text = "#e0def4";
          cursor = "#524f67";
        };

        vi_mode_cursor = {
          text = "#e0def4";
          cursor = "#524f67";
        };

        search = {
          matches = {
            foreground = "#908caa";
            background = "#26233a";
          };
          focused_match = {
            foreground = "#191724";
            background = "#ebbcba";
          };
        };

        hints = {
          start = {
            foreground = "#908caa";
            background = "#1f1d2e";
          };
          end = {
            foreground = "#6e6a86";
            background = "#1f1d2e";
          };
        };

        line_indicator = {
          foreground = "None";
          background = "None";
        };

        footer_bar = {
          foreground = "#e0def4";
          background = "#1f1d2e";
        };

        selection = {
          text = "#e0def4";
          background = "#403d52";
        };

        normal = {
          black = "#26233a";
          red = "#eb6f92";
          green = "#31748f";
          yellow = "#f6c177";
          blue = "#9ccfd8";
          magenta = "#c4a7e7";
          cyan = "#ebbcba";
          white = "#e0def4";
        };

        bright = {
          black = "#6e6a86";
          red = "#eb6f92";
          green = "#31748f";
          yellow = "#f6c177";
          blue = "#9ccfd8";
          magenta = "#c4a7e7";
          cyan = "#ebbcba";
          white = "#e0def4";
        };

        dim = {
          black = "#6e6a86";
          red = "#eb6f92";
          green = "#31748f";
          yellow = "#f6c177";
          blue = "#9ccfd8";
          magenta = "#c4a7e7";
          cyan = "#ebbcba";
          white = "#e0def4";
        };
      };
    };
  };
}
