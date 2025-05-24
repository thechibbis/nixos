{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  programs.waybar = {
    enable = true;

    settings = [
      {
        height = 24;
        spacing = 4;

        modules-left = [
          "hyprland/window"
        ];

        modules-center = [
          "hyprland/workspaces"
        ];

        modules-right = [
          "tray"
          "pulseaudio"
          "network"
          "memory"
          "temperature#cpu"
          "temperature#gpu"
          "keyboard-state"
          "clock"
        ];

        "hyprland/window" = {
          format = "{}";
          max-length = 40;
        };

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          on-click = "activate";
          format = "{icon}";
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "10";
          };
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };

        "tray" = {
          spacing = 10;
        };

        "clock" = {
          format = "{:%Y-%m-%d %I:%M}";
          interval = 60;
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "cpu" = {
          format = "{usage}% ";
          tooltip = false;
        };

        "memory" = {
          format = "{}% ";
        };

        "temperature#cpu" = {
          hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 70;
          format = " {temperatureC}°C {icon}";
          format-icons = ["" "" ""];
        };

        "temperature#gpu" = {
          hwmon-path = "/sys/class/hwmon/hwmon1/temp1_input";
          critical-threshold = 80;
          format = "  {temperatureC}°C {icon}";
          format-icons = ["" "" ""];
        };

        "network" = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };

        "pulseaudio" = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            "hands-free" = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
          on-click = "pavucontrol";
        };

        "custom/media" = {
          format = "{icon} {}";
          return-type = "json";
          max-length = 40;
          format-icons = {
            spotify = "";
            default = "🎜";
          };
          escape = true;
          exec = "$HOME/.config/waybar/mediaplayer.py 2> /dev/null";
        };
      }
    ];

    style = ''
        @define-color base            #191724;
        @define-color surface         #1f1d2e;
        @define-color overlay         #26233a;

        @define-color muted           #6e6a86;
        @define-color subtle          #908caa;
        @define-color text            #e0def4;

        @define-color love            #eb6f92;
        @define-color gold            #f6c177;
        @define-color rose            #ebbcba;
        @define-color pine            #31748f;
        @define-color foam            #9ccfd8;
        @define-color iris            #c4a7e7;

        @define-color highlightLow    #21202e;
        @define-color highlightMed    #403d52;
        @define-color highlightHigh   #524f67;

      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrains Mono NL ExtraBold";
        /* font-weight: bold; */
        font-size: 12px;
        min-height: 0;
      }

      window#waybar {
        background: rgba(21, 18, 27, 0);
        color: @text;
      }

      tooltip {
        background: @base;
        border-radius: 4px;
        border-width: 2px;
        border-style: solid;
        border-color: @overlay;
      }

      #workspaces button {
        padding: 5px;
        color: @highlightMed;
        margin-right: 5px;
      }

      #workspaces button.active {
        color: @text;
      }

      #workspaces button.focused {
        color: @subtle;
        background: @love;
        border-radius: 8px;
      }

      #workspaces button.urgent {
        color: @base;
        background: @pine;
        border-radius: 8px;
      }

      #workspaces button:hover {
        background: @highlightLow;
        color: @text;
        border-radius: 8px;
      }

      #custom-power_profile,
      #window,
      #clock,
      #battery,
      #pulseaudio,
      #network,
      #bluetooth,
      #temperature,
      #workspaces,
      #tray,
      #memory,
      #backlight {
        background: @base;
        opacity: 0.9;
        padding: 0px 10px;
        margin: 0px 0px;
        border: 2px solid @pine;
        margin-top: 5px;
      }


      #memory {
        color: #3e8fb0;
        border-radius: 8px 0px 0px 8px;
      }

      #temperature {
        color: @gold;
        border-radius: 0px 8px 8px 0px;
      }

      #temperature.critical {
        border-radius: 8px;
        border-left: 0px;
        color: @love;
      }

      #tray {
        border-radius: 8px;
        margin-left: 10px;
        margin-right: 0px;
      }

      #workspaces {
        background: @base;
        border-radius: 8px;
      }

      #custom-power_profile {
        color: @foam;
        border-left: 0px;
      }

      #window {
        margin-left: 5px;
        border-radius: 8px;
      }

      window#waybar.empty {
        background-color: transparent;
      }

      window#waybar.empty #window {
        padding: 0px;
        margin: 0px;
        border: 0px;
        /*  background-color: rgba(66,66,66,0.5); */
        /* transparent */
        background-color: transparent;
      }

      #clock {
        color: @text;
        background: @pine;
        border-radius: 8px;
        margin-right: 5px;
      }

      #network {
        color: @love;
        border-radius: 8px;
      }

      #pulseaudio {
        color: @iris;
        border-radius: 8px;
      }
    '';
  };
}
