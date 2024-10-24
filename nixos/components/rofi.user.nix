{
  libs,
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    terminal = "kitty";
    font = "Lilex Nerd Font 15";
    theme = "~/lausys/nixos/configs/rofi/catppuccin-macchiato.rasi";
    location = "center";
    extraConfig = {
      modi = "run,drun,window";
      # icon-theme = "Oranchelo";
      show-icons = true;
      drun-display-format = "{icon} {name}";
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "  Apps ";
      display-run = "  Run ";
      display-window = "  Window";
      display-Network = " 󰤨 Network";
      sidebar-mode = true;
    };
  };
}
