{ config, pkgs, ... }:

{
  home.username = "broken_analysis";
  home.homeDirectory = "/home/broken_analysis";
  home.stateVersion = "25.11";

  imports = [
    ./modules/desktop/waybar.nix
    ./modules/desktop/rofi.nix
    ./modules/desktop/gtk.nix
    ./modules/apps/apps.nix
    ./modules/apps/neovim.nix
    ./modules/apps/firefox.nix
  ];

  # ── Hyprland ────────────────────────────────────────────────────────────────
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;

    settings = {
      monitor = "eDP-1,preferred,auto,1";

      exec-once = [
        "hyprpaper"
        "waybar"
        "dunst"
	"blueman-applet"
	"${pkgs.gnome-keyring}/bin/gnome-keyring-daemon --start --components=secrets"
      ];

      general = {
        gaps_in = 6;
        gaps_out = 12;
        border_size = 2;
        "col.active_border" = "rgb(c4a7e7) rgb(ebbcba) 45deg";
        "col.inactive_border" = "rgb(403d52)";
        layout = "dwindle";
      };
      dwindle = {
        pseudotile = true;       # lets you leave empty space in a tile
        preserve_split = true;   # split direction stays consistent
        smart_split = false;
        smart_resizing = true;
      };

      master = {
        new_status = "slave";    # new windows go to stack, not master
        mfact = 0.55;            # master takes 55% of screen
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 6;
          passes = 3;
        };
        shadow = {
          enabled = true;
          range = 12;
          render_power = 3;
          color = "rgba(1a1a2e99)";
        };
      };

      animations = {
        enabled = true;
        bezier = "rosepine, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 6, rosepine"
          "windowsOut, 1, 4, default, popin 80%"
          "fade, 1, 6, default"
          "workspaces, 1, 5, rosepine"
        ];
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
          tap-to-click = true;
        };
      };

      "$mod" = "SUPER";

      windowrulev2 = [
      # Float common dialog types automatically
      "float, class:^(xdg-desktop-portal).*"
      "float, title:^(Open File).*"
      "float, title:^(Save File).*"
      "float, title:^(Confirm).*"
      "float, class:^(pavucontrol)$"

  # Center floating windows
      "center, floating:1"

  # Give floating windows a sensible default size
      "size 800 500, floating:1, class:^(pavucontrol)$"
    ];

      bind = [
        "$mod, Return, exec, kitty"
        "$mod, D, exec, rofi -show drun -theme ~/.config/rofi/rosepine.rasi"
        "$mod, Q, killactive"
        "$mod, F, fullscreen"
        "$mod SHIFT, F, togglefloating"
        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"
        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, L, movewindow, r"
        "$mod SHIFT, K, movewindow, u"
        "$mod SHIFT, J, movewindow, d"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        ", Print, exec, grim -g \"$(slurp)\" ~/Pictures/screenshot-$(date +%s).png"
# ── Layout switching ────────────────────────────────
        "$mod, Space, togglefloating"
        "$mod SHIFT, Space, exec, hyprctl keyword general:layout dwindle"
        "$mod CTRL, Space, exec, hyprctl keyword general:layout master"

# ── Pseudotile (leave empty space in tiling) ────────
        "$mod, P, pseudo"

# ── Scratchpad ──────────────────────────────────────
        "$mod SHIFT, minus, movetoworkspace, special:scratch"
        "$mod, minus, togglespecialworkspace, scratch"

# ── Move floating windows with keyboard ─────────────
        "$mod SHIFT, left,  moveactive, -30 0"
        "$mod SHIFT, right, moveactive,  30 0"
        "$mod SHIFT, up,    moveactive,  0 -30"
        "$mod SHIFT, down,  moveactive,  0  30"
      ];

      bindel = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ];

      binde = [
      # Resize with Super + Alt + HJKL
        "$mod ALT, H, resizeactive, -30 0"
        "$mod ALT, L, resizeactive,  30 0"
        "$mod ALT, K, resizeactive,  0 -30"
        "$mod ALT, J, resizeactive,  0  30"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"    # Super + left click drag = move
        "$mod, mouse:273, resizewindow"  # Super + right click drag = resize
      ];
    };
  };

  # ── Hyprpaper ───────────────────────────────────────────────────────────────
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/Pictures/wallpapers/puppeteered.png" ];
      wallpaper = [ ",/home/broken_analysis/Pictures/wallpapers/puppeteered.png" ];
      splash = false;
    };
  };

  # ── Kitty ───────────────────────────────────────────────────────────────────
  programs.kitty = {
    enable = true;
    settings = {
      foreground = "#e0def4";
      background = "#191724";
      selection_foreground = "#e0def4";
      selection_background = "#403d52";

      color0  = "#26233a";
      color1  = "#eb6f92";
      color2  = "#31748f";
      color3  = "#f6c177";
      color4  = "#9ccfd8";
      color5  = "#c4a7e7";
      color6  = "#ebbcba";
      color7  = "#e0def4";
      color8  = "#6e6a86";
      color9  = "#eb6f92";
      color10 = "#31748f";
      color11 = "#f6c177";
      color12 = "#9ccfd8";
      color13 = "#c4a7e7";
      color14 = "#ebbcba";
      color15 = "#e0def4";

      font_family          = "JetBrainsMono Nerd Font";
      font_size            = "13.0";
      window_padding_width = 12;
      confirm_os_window_close = 0;
    };
  };

  # ── Zsh ─────────────────────────────────────────────────────────────────────
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = { 
    anime = "ani-cli --dub";
    nix-commit = "sudo /etc/nixos/rebuild,sh";
    initExtra = ''
      export ANI_CLI_DOWNLOAD_DIR="/home/broken_analysis/anime"
      '';
  };

  # ── Allow unfree (Spotify etc.) ─────────────────────────────────────────────
  nixpkgs.config.allowUnfree = true;
}
