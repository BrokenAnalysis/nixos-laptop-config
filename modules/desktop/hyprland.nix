{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;  # compatibility for apps that need X11
  };

  environment.systemPackages = with pkgs; [
    hyprpaper        # wallpaper
    hyprlock         # lockscreen
    hypridle         # auto-lock on idle
    waybar           # status bar
    rofi             # app launcher
    dunst            # notifications
    brightnessctl    # screen brightness
    playerctl        # media key support
    wl-clipboard     # clipboard for wayland
    grim             # screenshots
    slurp            # region select for screenshots
  ];
}
