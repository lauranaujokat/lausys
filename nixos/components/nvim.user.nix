{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;

    # for displaying images in neovim
    extraLuaPackages = ps: [ps.magick];
    extraPackages = [pkgs.imagemagick];
  };
  home.activation.link_nvim = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ln -sf $VERBOSE_ARG ~/lausys/nixos/configs/nvim ${config.xdg.configHome}
  '';
}
