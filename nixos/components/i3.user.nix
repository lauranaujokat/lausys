{
  lib,
  config,
  pkgs,
  ...
}: let
  mod = "Mod4";
  mainShell = "kitty";
  mainDmenu = "rofi -show drun";
  mainPowermenu = "i3 exit";
  mainBrowser = "firefox";
  icons = config.icons;
  colors = config.colors;

  rosewater = colors.rosewater;
  peach = colors.peach;
  blue = colors.blue;
  text = colors.text;
  overlay0 = colors.overlay0;
  base = colors.base;
  # Workspace names

  ws1 = "1: ${icons.terminal}";
  ws2 = "2: ${icons.discord}";
  ws3 = "3: ${icons.firefox}";
  ws4 = "4: ${icons.steam}";
  ws5 = "5";
  ws6 = "6";
  ws7 = "7";
  ws8 = "8";
  ws9 = "9";
  ws10 = "10";
in {
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = mod;

      fonts = {
        names = ["Lilex Nerd Font"];
      };

      gaps = {
        inner = 10;
        outer = 0;
      };

      window = {
        titlebar = false;
        border = 3;
      };

      focus = {
        newWindow = "smart";
      };

      startup = [
        {
          command = "${pkgs.feh}/bin/feh --bg-scale ${../assets/wallpaper.png}";
          always = false;
          notification = false;
        }
        {
          command = "~/.nix-profile/bin/polybar";
          always = false;
          notification = false;
        }
        {
          command = "i3 workspace number ${ws1}";
          always = false;
          notification = false;
        }
      ];

      # Assign programs to always open in specified workspace
      assigns = {};

      bars = [];

      # floating
      floating = {
        titlebar = false;
        border = 3;
      };

      keybindings = {
        # media-keys
        "XF86AudioRaiseVolume" = "exec --no-startup-id pamixer -i 1";
        "XF86AudioLowerVolume" = "exec --no-startup-id pamixer -d 1";
        "XF86AudioPlay" = "exec playerctl play-pause";

        "XF86AudioMute" = "exec --no-startup-id pamixer -t";
        "XF86AudioMicMute" = "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        "XF86MonBrightnessUp" = "exec brightnessctl s +2%";
        "XF86MonBrightnessDown" = "exec brightnessctl s 2%-";

        # The two basic commands (closing windows and opening shells)
        "${mod}+Return" = "exec ${mainShell}";
        "${mod}+q" = "kill";

        # =====================================================================
        # Commands to move windows
        # =====================================================================
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";

        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";

        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";

        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";

        "${mod}+Shift+Control+h" = "move workspace to output left";
        "${mod}+Shift+Control+j" = "move workspace to output down";
        "${mod}+Shift+Control+k" = "move workspace to output up";
        "${mod}+Shift+Control+l" = "move workspace to output right";

        # splits
        "${mod}+b" = "split h";
        "${mod}+v" = "split v";

        # fullscreen
        "${mod}+f" = "fullscreen toggle";

        # floating keys
        "${mod}+Shift+space" = "floating toggle";
        "${mod}+space" = "focus mode_toggle";

        # go to workspaces
        "${mod}+1" = "workspace number ${ws1}";
        "${mod}+2" = "workspace number ${ws2}";
        "${mod}+3" = "workspace number ${ws3}";
        "${mod}+4" = "workspace number ${ws4}";
        "${mod}+5" = "workspace number ${ws5}";
        "${mod}+6" = "workspace number ${ws6}";
        "${mod}+7" = "workspace number ${ws7}";
        "${mod}+8" = "workspace number ${ws8}";
        "${mod}+9" = "workspace number ${ws9}";
        "${mod}+0" = "workspace number ${ws10}";

        # move to workspaces
        "${mod}+Shift+1" = "move container to workspace number ${ws1}";
        "${mod}+Shift+2" = "move container to workspace number ${ws2}";
        "${mod}+Shift+3" = "move container to workspace number ${ws3}";
        "${mod}+Shift+4" = "move container to workspace number ${ws4}";
        "${mod}+Shift+5" = "move container to workspace number ${ws5}";
        "${mod}+Shift+6" = "move container to workspace number ${ws6}";
        "${mod}+Shift+7" = "move container to workspace number ${ws7}";
        "${mod}+Shift+8" = "move container to workspace number ${ws8}";
        "${mod}+Shift+9" = "move container to workspace number ${ws9}";
        "${mod}+Shift+0" = "move container to workspace number ${ws10}";

        # restart i3
        "${mod}+Shift+r" = "restart";

        "${mod}+r" = "mode \"resize\"";

        # scratchpad
        "${mod}+shift+a" = "move scratchpad";
        "${mod}+a" = "scratchpad show";

        # programs
        "${mod}+d" = "exec ${mainDmenu}";
        "${mod}+o" = "exec ${mainBrowser}";
        "${mod}+x" = "exec ${mainPowermenu}";

        # for screenshots
        "${mod}+shift+s" = "exec flameshot gui";
      };

      modes = {
        resize = {
          "h" = "resize shrink width 1 px or 1 ppt";
          "j" = "resize grow height 1 px or 1 ppt";
          "k" = "resize shrink height 1 px or 1 ppt";
          "l" = "resize grow width 1 px or 1 ppt";

          "Left" = "resize shrink width 1 px or 1 ppt";
          "Down" = "resize grow height 1 px or 1 ppt";
          "Up" = "resize shrink height 1 px or 1 ppt";
          "Right" = "resize grow width 1 px or 1 ppt";

          "Return" = "mode \"default\"";
          "Escape" = "mode \"default\"";
          "$mod+r" = "mode \"default\"";
        };
      };
      colors = {
        "focused" = {
          "border" = "${blue}";
          "background" = "${base}";
          "text" = "${text}";
          "indicator" = "${blue}";
          "childBorder" = "${blue}";
        };
        "focusedInactive" = {
          "border" = "${overlay0}";
          "background" = "${base}";
          "text" = "${text}";
          "indicator" = "${rosewater}";
          "childBorder" = "${overlay0}";
        };
        "unfocused" = {
          "border" = "${overlay0}";
          "background" = "${base}";
          "text" = "${text}";
          "indicator" = "${rosewater}";
          "childBorder" = "${overlay0}";
        };
        "urgent" = {
          "border" = "${peach}";
          "background" = "${base}";
          "text" = "${peach}";
          "indicator" = "${overlay0}";
          "childBorder" = "${peach}";
        };
        "placeholder" = {
          "border" = "${overlay0}";
          "background" = "${base}";
          "text" = "${text}";
          "indicator" = "${overlay0}";
          "childBorder" = "${overlay0}";
        };
        "background" = "${base}";
      };
    };
  };

  programs.feh.enable = true;
}
