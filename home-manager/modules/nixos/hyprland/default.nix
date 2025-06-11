{
  imports = [
    ./hypridle.nix
    ./hyprlock.nix
    ./configs/binds.nix
    ./configs/monitors.nix
    ./configs/windowrules.nix
    ./configs/workspaces.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings = {
      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SCREENSHOTS_DIR,$HOME/Pictures/Screenshots"
      ];


      "$terminal" = "ghostty";
      "$fileManager" = "nautilus";
      "$menu" = "wofi";
      "$browser" = "firefox";

      exec-once = [
        "waybar & nm-applet"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "swaync"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 5;

        border_size = 5;

        resize_on_border = true;

        allow_tearing = false;
        layout = "master";
      };

      decoration = {
        rounding = 5;
        rounding_power = 2;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = false;
        };

        blur = {
          enabled = false;
        };
      };

      animations = {
        enabled = true;
      };

      input = {
        kb_layout = "de, us";
        kb_options = "ctrl:nocaps";

        touchpad = {
          scroll_factor = 0.5;
          natural_scroll = true;
        };
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_invert = true;
        workspace_swipe_forever	= false;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "slave";
        new_on_top = true;
        mfact = 0.5;
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
    };
  };
}
