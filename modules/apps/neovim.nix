{ config, pkgs, ... }:

let
  nvimDir = ./nvim;
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      lua-language-server
      nil
      nodePackages.typescript-language-server
      pyright
      emmet-ls
      ripgrep
      fd
      gcc
      nodejs
    ];
  };

  home.file.".config/nvim/init.lua".source                            = "${nvimDir}/config/init.lua";
  home.file.".config/nvim/lua/config/lazy.lua".source                = "${nvimDir}/config/lazy.lua";
  home.file.".config/nvim/lua/config/options.lua".source             = "${nvimDir}/config/options.lua";
  home.file.".config/nvim/lua/config/keymaps.lua".source             = "${nvimDir}/config/keymaps.lua";
  home.file.".config/nvim/lua/plugins/rosepine.lua".source           = "${nvimDir}/plugins/rosepine.lua";
  home.file.".config/nvim/lua/plugins/dashboard.lua".source          = "${nvimDir}/plugins/dashboard.lua";
  home.file.".config/nvim/lua/plugins/telescope.lua".source          = "${nvimDir}/plugins/telescope.lua";
  home.file.".config/nvim/lua/plugins/lsp.lua".source                = "${nvimDir}/plugins/lsp.lua";
  home.file.".config/nvim/lua/plugins/completion.lua".source         = "${nvimDir}/plugins/completion.lua";
  home.file.".config/nvim/lua/plugins/ui.lua".source                 = "${nvimDir}/plugins/ui.lua";
}
