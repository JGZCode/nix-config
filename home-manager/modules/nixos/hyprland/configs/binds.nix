#See https://wiki.hyprland.org/Configuring/Binds/

{ pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
   
    bind = [
      "SUPER,       Q, killactive,"
      "SUPER  CTRL, Q, exit,"
      "SUPER SHIFT, Q, exec, loginctl lock-session"
      "SUPER,   SPACE, exec, $menu --show drun"
      "SUPER,       F, togglefloating,"
      "SUPER,       P, pin,"
      "SUPER  CTRL, B, exec, hyprctl switchxkblayout current next"
     
      #program shortcuts
      "SUPER, R,      exec, $fileManager"
      "SUPER, RETURN, exec, $terminal"

      # program shortcuts with scripts
      ", XF86AudioMedia, exec, $HOME/.nix-config/lib/scripts/appStartFocusToggle.sh obsidian obsidian special:󱓩"
      "SUPER, up, exec, $HOME/.nix-config/lib/scripts/appStartFocusToggle.sh obsidian obsidian special:󱓩"
      "SUPER, B,      exec, $HOME/.nix-config/lib/scripts/appStartFocusToggle.sh firefox firefox 1"

      # Moving focus
      "SUPER, H, movefocus, l"
      "SUPER, L, movefocus, r"
      "SUPER, K, movefocus, u"
      "SUPER, J, movefocus, d"

      # Moving windows
      "SUPER SHIFT, H, swapwindow, l"
      "SUPER SHIFT, L, swapwindow, r"
      "SUPER SHIFT, K, swapwindow, u"
      "SUPER SHIFT, J, swapwindow, d"

      # Resizeing windows                   X  Y
      "SUPER CTRL, left,  resizeactive, -60 0"
      "SUPER CTRL, right, resizeactive,  60 0"
      "SUPER CTRL, up,    resizeactive,  0 -60"
      "SUPER CTRL, down,  resizeactive,  0  60"

      # Switching workspaces
      "SUPER, 1, workspace, 1"
      "SUPER, 2, workspace, 2"
      "SUPER, 3, workspace, 3"
      "SUPER, 4, workspace, 4"

      # Moving windows to workspaces
      "SUPER SHIFT, 1, movetoworkspacesilent, 1"
      "SUPER SHIFT, 2, movetoworkspacesilent, 2"
      "SUPER SHIFT, 3, movetoworkspacesilent, 3"
      "SUPER SHIFT, 4, movetoworkspacesilent, 4"

      # Scratchpad
      "SUPER,       S, togglespecialworkspace,  magic"
      "SUPER SHIFT, S, movetoworkspace, special:magic"
    ];

    # Move/resize windows with SUPER + LMB/RMB and dragging  -m -> mouse
    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];

    bindr = [
      # Screenshots
      ", PRINT, exec, hyprshot -m region --clipboard-only"
      "SUPER, PRINT, exec, hyprshot -m window --clipboard-only"
    ];

    # -l -> do stuff even when locked
    # -e -> repeats when key is held

    # Laptop multimedia keys for volume and LCD brightness 
    bindle = [
      ",XF86AudioRaiseVolume,  exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute,      exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp,   exec, brightnessctl s 10%+"
      ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
    ];

    # Audio playback
    bindl = [
      ", XF86AudioNext,  exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay,  exec, playerctl play-pause"
      ", XF86AudioPrev,  exec, playerctl previous"
    ];
  };
}
