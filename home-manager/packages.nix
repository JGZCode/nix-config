{ lib, pkgs, darwin, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs;
    [
      # utils
      ripgrep
      ollama
      podman

    ] ++ (lib.optionals (darwin) [ # only on darwin systems

    ]) ++ (lib.optionals (!darwin) [ # only on nixos systems
      # apps
      discord
      firefox
      obsidian
      signal-desktop

      # utils
      clang
      hyprshot # for taking screenshots
      jq # Lightweight and flexible command-line JSON processor
      qimgv # Lightweight Imageviewer
      nixfmt-classic # nix code formatter

      # WM
      brightnessctl
      libnotify
      nautilus
      networkmanagerapplet
      pavucontrol
      wl-clipboard
    ]);
}
