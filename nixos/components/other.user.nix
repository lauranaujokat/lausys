{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.bat.enable = true;
  programs.eza.enable = true;
  programs.starship.enable = true;
}
