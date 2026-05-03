{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 36;
        spacing = 4;

        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "battery" "network" "tray" ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          format = "{icon}";
          format-icons = {
            "1" = "󰲠";
            "2" = "󰲢";
            "3" = "󰲤";
            "4" = "󰲦";
            "5" = "󰲨";
            urgent = "󰗖";
            default = "󰊠";
          };
        };

        "hyprland/window" = {
          max-length = 50;
          separate-outputs = true;
        };

        clock = {
          format = "  {:%H:%M}";
          format-alt = "  {:%A, %B %d}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}  {capacity}%";
          format-charging = "󰂄  {capacity}%";
          format-plugged = "󰚥  {capacity}%";
          format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        };

        network = {
          format-wifi = "󰤨  {essid}";
          format-ethernet = "󰈀  Connected";
          format-disconnected = "󰤭  Disconnected";
          tooltip-format = "{ifname}: {ipaddr}";
        };

        pulseaudio = {
          format = "{icon}  {volume}%";
          format-muted = "󰝟  Muted";
          format-icons = {
            default = [ "󰕿" "󰖀" "󰕾" ];
          };
          on-click = "pavucontrol";
        };

        tray = {
          spacing = 10;
        };
      };
    };

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
        border: none;
        border-radius: 0;
        min-height: 0;
      }

      window#waybar {
        background-color: #191724;
        color: #e0def4;
        border-bottom: 2px solid #26233a;
      }

      .modules-left,
      .modules-center,
      .modules-right {
        padding: 0 8px;
      }

      #workspaces button {
        padding: 0 8px;
        color: #6e6a86;
        background: transparent;
        border-radius: 6px;
        margin: 4px 2px;
        transition: all 0.2s ease;
      }

      #workspaces button.active {
        color: #e0def4;
        background: #26233a;
      }

      #workspaces button:hover {
        color: #c4a7e7;
        background: #1f1d2e;
      }

      #workspaces button.urgent {
        color: #eb6f92;
      }

      #window {
        color: #908caa;
        padding: 0 8px;
      }

      #clock {
        color: #ebbcba;
        padding: 0 12px;
        font-weight: 500;
      }

      #battery {
        color: #9ccfd8;
        padding: 0 12px;
      }

      #battery.warning {
        color: #f6c177;
      }

      #battery.critical {
        color: #eb6f92;
      }

      #network {
        color: #31748f;
        padding: 0 12px;
      }

      #pulseaudio {
        color: #c4a7e7;
        padding: 0 12px;
      }

      #pulseaudio.muted {
        color: #6e6a86;
      }

      #tray {
        padding: 0 8px;
      }
    '';
  };
}
