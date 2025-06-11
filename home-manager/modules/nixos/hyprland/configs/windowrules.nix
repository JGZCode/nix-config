{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      # Possibly a global rule? (may be misconfigured or incomplete)
      "bordersize 0, floating:0, onworkspace:w[t1]"

      # Floating windows

      # waybar modules
      "float, title:^(Bluetooth Devices)$"
      "center,title:^(Bluetooth Devices)$"
      "size 600 400,title:^(Bluetooth Devices)$"

      "float, title:^(Volume Control)$"
      "center,title:^(Volume Control)$"
      "size 600 400,title:^(Volume Control)$"

      #qimgv - imageviewer
      "float, class:^(qimgv)$"
      #"center,class:^(qimgv)$"

      #
      "float,class:(mpv)|(imv)|(showmethekey-gtk)"

      # Position, size and behavior of showmethekey
      "move 990 60,size 900 170,pin,noinitialfocus,class:(showmethekey-gtk)"
      "noborder,nofocus,class:(showmethekey-gtk)"

      # Suppress maximize events for all windows
      "suppressevent maximize, class:.*"

      # Prevent focus for empty, non-pinned XWayland windows
      "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

      # Rules for xwaylandvideobridge (e.g. for screen sharing)
      "opacity 0.0 override, class:^(xwaylandvideobridge)$"
      "noanim, class:^(xwaylandvideobridge)$"
      "noinitialfocus, class:^(xwaylandvideobridge)$"
      "maxsize 1 1, class:^(xwaylandvideobridge)$"
      "noblur, class:^(xwaylandvideobridge)$"
      "nofocus, class:^(xwaylandvideobridge)$"
    ];
  };
}
