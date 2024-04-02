{
  config,
  lib,
  ...
}: {
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "catppuccin_macchiato";
      theme_background = false;
      update_ms = 100;
    };
  };
  home.activation.link_btop = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ln -sf $VERBOSE_ARG ~/lausys/nixos/configs/btop ${config.xdg.configHome}
  '';
}
