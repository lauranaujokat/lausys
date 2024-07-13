{
  config,
  pkgs,
  home,
  lib,
  inputs, # added for spicetify
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
    inputs.spicetify-nix.homeManagerModules.default # added for spicetify
    ./components/spicetify.user.nix
    ./components/mpv.user.nix
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
  programs.home-manager.enable = true;
  home.pointerCursor = let
    getFrom = url: hash: name: {
      gtk.enable = true;
      x11.enable = true;
      name = name;
      size = 24;
      package = pkgs.runCommand "moveUp" {} ''
        mkdir -p $out/share/icons
        ln -s ${pkgs.fetchzip {
          url = url;
          hash = hash;
        }} $out/share/icons/${name}
      '';
    };
  in
    getFrom
    "https://github.com/catppuccin/cursors/releases/download/v0.3.1/catppuccin-macchiato-blue-cursors.zip"
    "sha256-oRHq/z/Jn7jLWH2QXHoHg1XssfHimGvtVr9AB8wRMr0="
    "macchiato-blue";
}
