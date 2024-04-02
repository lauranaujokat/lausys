{pkgs, ...}: {
  programs = {
    firefox = {
      enable = true;
      package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
        extraPolicies = {
          ExtensionSettings = {
            "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
            # uBlock Origin:
            "uBlock0@raymondhill.net" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
              installation_mode = "force_installed";
            };
            # Privacy Badger:
            "jid1-MnnxcxisBPnSXQ@jetpack" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
              installation_mode = "force_installed";
            };
            # Stylus:
            "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/styl-us/latest.xpi";
              installation_mode = "force_installed";
            };
            # Sponsorblock:
            "sponsorBlocker@ajay.app" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
              installation_mode = "force_installed";
            };
            # Firefox Color:
            "FirefoxColor@mozilla.com" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/firefox-color/latest.xpi";
              installation_mode = "force_installed";
            };
            # Firefox Color:
            "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
              installation_mode = "force_installed";
            };
          };
          Preferences = {
          };
        };
      };
    };
  };
}
