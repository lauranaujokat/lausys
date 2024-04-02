{
  config,
  pkgs,
  home,
  lib,
  ...
}: {
  imports = [
    ./components/picom.user.nix
    ./components/git.user.nix
    ./components/globals.user.nix
    ./components/btop.user.nix
    ./components/chromium.user.nix
    ./components/i3.user.nix
    ./components/kitty.user.nix
    ./components/nvim.user.nix
    ./components/fish.user.nix
    ./components/starship.user.nix
    ./components/other.user.nix
    ./components/rofi.user.nix
    ./components/polybar.user.nix
    ./components/gtk.user.nix
  ];
  home.username = "laura";
  home.homeDirectory = "/home/laura";

  home.packages = [pkgs.dconf];

  home.sessionVariables = {
    EDITOR = "nvim";
  };
  services.gnome-keyring = {
    enable = true;
    components = ["secrets"];
  };
  home.file = {};
  home.stateVersion = "23.11";
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.catppuccin-cursors.macchiatoBlue;
    name = "Catppuccin-Macchiato-Blue-Cursors";
    size = 40;
  };
  programs.home-manager.enable = true;
}
