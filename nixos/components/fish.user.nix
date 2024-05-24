{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.bat.enable = true;
  programs.eza.enable = true;
  programs.fish = {
    enable = true;
    shellAliases = {
      update = ''
        alejandra ~/lausys &>/dev/null
        sudo nixos-rebuild switch --flake path:/home/laura/lausys#nixos'';
      c = "clear";
      n = "nvim .";
      cat = "bat";
      y = "yazi";
      ls = "exa -1la";
    };
    shellInit = ''
      set -U fish_greeting
      starship init fish | source
      zoxide init --cmd cd fish | source
    '';
  };
}
