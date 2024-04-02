{
  config,
  lib,
  ...
}: {
  programs.btop = {
    enable = true;
  };
  home.activation.link_btop = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ln -sf $VERBOSE_ARG ~/lausys/nixos/configs/btop ${config.xdg.configHome}
  '';
}
