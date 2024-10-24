{
  libs,
  pkgs,
  ...
}: {
  programs.kitty = {
    enable = true;

    themeFile = "Catppuccin-Macchiato";

    font = {
      name = "Lilex Nerd Font";
      size = 15;
    };

    settings = {
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";

      disable_ligatures = "cursor";
      cursor_shape = "beam";

      enable_audio_bell = "no";

      background_opacity = "1";

      confirm_os_window_close = "0";
    };

    keybindings = {
      "ctrl+shift" = "kitty_mod";
    };
  };
}
