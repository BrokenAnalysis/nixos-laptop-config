{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    profiles.default = {
      name = "default";
      isDefault = true;

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.uidensity" = 1;
        "browser.tabs.inTitlebar" = 0;
        "gfx.webrender.all" = true;
        "privacy.donottrackheader.enabled" = true;
        "browser.search.suggest.enabled" = false;
      };

      userChrome = ''
        :root {
          --base:    #191724;
          --surface: #1f1d2e;
          --overlay: #26233a;
          --muted:   #6e6a86;
          --text:    #e0def4;
          --iris:    #c4a7e7;
          --rose:    #ebbcba;
          --love:    #eb6f92;
        }

        /* Tab bar background */
        #TabsToolbar {
          background-color: var(--base) !important;
          border-bottom: 1px solid var(--overlay) !important;
        }

        /* Inactive tabs */
        .tabbrowser-tab:not([selected]) .tab-background {
          background-color: transparent !important;
        }

        /* Active tab */
        .tabbrowser-tab[selected] .tab-background {
          background-color: var(--surface) !important;
          border-radius: 8px 8px 0 0 !important;
        }

        /* Tab text */
        .tab-label {
          color: var(--text) !important;
        }

        /* Nav bar */
        #nav-bar {
          background-color: var(--base) !important;
          border-bottom: 1px solid var(--overlay) !important;
          box-shadow: none !important;
        }

        /* URL bar unfocused */
        #urlbar-background {
          background-color: var(--surface) !important;
          border: 1px solid var(--overlay) !important;
          border-radius: 8px !important;
        }

        /* URL bar focused */
        #urlbar[focused] #urlbar-background {
          border-color: var(--iris) !important;
          box-shadow: 0 0 0 1px var(--iris) !important;
        }

        /* URL bar text */
        #urlbar-input {
          color: var(--text) !important;
        }

        /* Toolbar buttons */
        toolbar .toolbarbutton-1 {
          color: var(--muted) !important;
        }

        toolbar .toolbarbutton-1:hover {
          color: var(--text) !important;
          background-color: var(--overlay) !important;
          border-radius: 6px !important;
        }

        /* Bookmarks bar */
        #PersonalToolbar {
          background-color: var(--base) !important;
          border-bottom: 1px solid var(--overlay) !important;
        }

        /* Sidebar */
        #sidebar-box {
          background-color: var(--surface) !important;
        }
      '';

      userContent = ''
        /* New tab page background */
        @-moz-document url("about:newtab"), url("about:home"), url("about:blank") {
          body {
            background-color: #191724 !important;
          }
        }
      '';
    };
  };
}
