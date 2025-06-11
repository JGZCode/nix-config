{ lib, system, ... }:
let
  mkGreedy = caskName: { name = caskName; greedy = true; };
in
{
  environment = {
    systemPath = if (system == "aarch64-darwin") then [
      "/opt/homebrew/bin"
      "/opt/homebrew/sbin"
    ] else [
      "/usr/local/bin"
      "/usr/local/sbin"
    ];
  };

  homebrew = {
    enable = true;

    onActivation = {
      # Note: autoUpdate & upgrade take very long on each rebuild
      autoUpdate = true;
      upgrade = true; # Upgrade outdated casks, formulae, and App Store apps
      # 'zap': uninstalls all formulae(and related files) not listed in the generated Brewfile
      cleanup = "zap";
    };

    # Applications to install from Mac App Store using mas
    # Need to install these Apps manually first so that apple account has records of them
    # otherwise Apple Store will refuse to install them.
    # see https://github.com/mas-cli/mas
    masApps = {
      # Xcode = 497799835;
    };

    taps = [
      "nikitabobko/tap"
    ];

    brews = [
    ];

    casks = [
      "aerospace"
      "discord"
      "firefox"
      "ghostty"
      "obsidian"

      "keepassxc"
      "utm" # Windows 11 virtualisation agent

      # /usr/sbin/softwareupdate --install-rosetta for Apple silicon
      # see https://github.com/microsoft/AL/issues/7506
      "visual-studio-code"
    ] ++ map mkGreedy [
      "microsoft-excel"
      "microsoft-teams"
    ];
  };
}
