{ config, pkgs, ... }:

{
  home.packages = [ pkgs.rofi ];

  home.file.".config/rofi/rosepine.rasi".text = ''
    * {
      bg:       #191724;
      surface:  #1f1d2e;
      overlay:  #26233a;
      muted:    #6e6a86;
      subtle:   #908caa;
      text:     #e0def4;
      love:     #eb6f92;
      gold:     #f6c177;
      rose:     #ebbcba;
      pine:     #31748f;
      foam:     #9ccfd8;
      iris:     #c4a7e7;

      background-color: @bg;
      border-color:     @overlay;
      text-color:       @text;
      font:             "JetBrainsMono Nerd Font 13";
    }

    window {
      background-color: @bg;
      border:           2px;
      border-color:     @iris;
      border-radius:    12px;
      width:            480px;
      padding:          12px;
    }

    mainbox {
      background-color: transparent;
      children:         [ inputbar, listview ];
      spacing:         16 px;
    }

    inputbar {
      background-color: @surface;
      border-radius:    8px;
      padding:          10px 14px;
      children:         [ prompt, entry ];
      spacing:          8px;
    }

    prompt {
      background-color: transparent;
      text-color:       @iris;
    }

    entry {
      background-color: transparent;
      text-color:       @text;
      placeholder:      "Search...";
      placeholder-color: @muted;
    }

    listview {
      background-color: transparent;
      lines:            8;
      spacing:          4px;
      scrollbar:        false;
    }

    element {
      background-color: transparent;
      border-radius:    6px;
      padding:          8px 12px;
      spacing:          8px;
      children:         [ element-icon, element-text ];
    }

    element selected {
      background-color: @surface;
      text-color:       @text;
    }

    element-icon {
      background-color: transparent;
      size:             1.2em;
    }

    element-text {
      background-color: transparent;
      text-color:       inherit;
      highlight:        bold;
    }
  '';

  home.file.".config/rofi/config.rasi".text = ''
    configuration {
      modi:                "drun,run";
      show-icons:          true;
      icon-theme:          "Papirus-Dark";
      drun-display-format: "{name}";
      display-drun:        " Apps";
      display-run:         " Run";
    }
  '';
}
