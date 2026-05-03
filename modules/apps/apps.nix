{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [

    # ── Terminal utilities ──────────────────────────────
    btop          # system monitor
    eza           # better ls
    bat           # better cat
    fzf           # fuzzy finder
    zoxide        # smarter cd
    ripgrep       # fast grep
    fd            # fast find
    unzip
    zip
    aria2
    curl
    openssl
    openssh
    gnugrep
    # ── Development ────────────────────────────────────
    git
    github-cli
    lazygit       # terminal git UI
    godot         # game engine
    podman        # docker but FOSS
    python312
    rustup
    lua
    gcc
    # ── GUI apps ───────────────────────────────────────
    obsidian
    pavucontrol   # volume control GUI
    nautilus      # file manager (lighter than thunar, no KDE deps)
    microsoft-edge
    steam
    # ── Media ──────────────────────────────────────────
    mpv           # video player
    imv           # image viewer (wayland native) 
    ani-skip      # skip anime intros
    ffmpeg
    yt-dlp
    # Ani-cli from master
    (ani-cli.overrideAttrs (old: {
      src = pkgs.fetchFromGitHub {
        owner = "pystardust";
        repo = "ani-cli";
        rev = "master";
        hash = "sha256-OyCKDN89sBz59+3JncMDyNOq8UMqqjara+A0Owo3oko=";
      };
    }))
  
    # ── Art ────────────────────────────────────────────
    gimp
    krita
    # ── Fonts ──────────────────────────────────────────
    # (declared separately below for clarity)

];

   
  # ── Font configuration ────────────────────────────────
  fonts.fontconfig.enable = true;
}
