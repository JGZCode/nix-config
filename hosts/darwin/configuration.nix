{
  imports = [
    ./darwin-mods
  ];

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
      interval = [
        {
          Hour = 6;
          Minute = 30;
          Weekday = 7;
        }
      ];
    };
  };

  # security.pam.enableSudoTouchIdAuth = true;
  security.pam.services.sudo_local = {
    enable = true;
    touchIdAuth = true;
    reattach = true;
  };
}

