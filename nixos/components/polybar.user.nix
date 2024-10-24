{
  config,
  pkgs,
  ...
}: let
  icons = config.icons;
  colors = config.colors;
in {
  services = {
    polybar = {
      enable = true;

      package = pkgs.polybar.override {
        i3Support = true;
        pulseSupport = true;
        iwSupport = true;
        githubSupport = true;
      };

      script = "";

      config = let
        background = colors.crust;

        foreground = colors.text;
        foreground-alt = colors.text;

        primary = colors.blue;
        secondary = colors.pink;
        alert = colors.red;

        fonts = {
          font-0 = "Lilex Nerd Font Mono:pixelsize=13;4";
          font-1 = "Lilex Nerd Font Mono:size=24;7";
          font-2 = "Lilex Nerd Font Mono:size=22;7";
        };
      in {
        "bar/main" =
          fonts
          // {
            width = "100%";
            height = 25;
            fixed-center = true;

            background = background;
            foreground = foreground;
            modules-left = "i3";
            modules-center = "date";
            modules-right = "cpu";
          };

        "settings" = {
          screenchange-reload = "true";
          pseudo-transparency = true;
        };

        "module/i3" = {
          type = "internal/i3";
          ws-icons = ["AHHH"];

          format = "<label-state> <label-mode>";
          strip-wsnumbers = true;
          pin-workspaces = true;

          # focused = "Active workspace on focused monitor";
          label-focused = "%{T2}%name%%{T-}%icon%";
          label-focused-background = primary;
          label-focused-foreground = background;
          label-focused-padding = 2;

          # unfocused = "Inactive workspace on any monitor";
          label-unfocused = "%{T2}%name%%{T-}";
          label-unfocused-background = background;
          label-unfocused-padding = 2;

          # visible = "Active workspace on unfocused monitor";
          label-visible = "%{T2}%name%%{T-}";
          label-visible-background = foreground;
          label-visible-foreground = background;
          label-visible-padding = 2;

          # urgent = "Workspace with urgency hint set";
          label-urgent = "%{T2}%name%%{T-}";
          label-urgent-background = alert;
          label-urgent-padding = 2;

          # urgent = "Workspace with urgency hint set";
          label-empty = "%{T2}%name%%{T-}";
          label-empty-background = alert;
          label-empty-padding = 2;
        };

        "module/cpu" = {
          type = "internal/cpu";
          interval = 2;

          format-prefix-foreground = foreground-alt;
          label = " %percentage%%";
          format-prefix = "%{T2}${icons.cpu}%{T-}";
        };
        "module/date" = {
          type = "internal/date";
          interval = "1";

          time = "%H:%M";
          time-alt = "%H:%M:%S";

          label = "%{T2}${icons.date}%{T-} %time% ";
        };
      };
    };
  };
}
