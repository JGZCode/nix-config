{ user, ... }:
{
  system = {
    primaryUser = user;
    stateVersion = 5;

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };

    defaults = {
      dock = {
        autohide = true;
        show-recents = false;
        mru-spaces = false;
        expose-group-apps = true;
        persistent-apps = [
          { app = "/System/Applications/Mail.app"; }
          { app = "/System/Applications/Calendar.app"; }
          { app = "/System/Applications/Notes.app"; }
          { app = "/System/Applications/Reminders.app"; }
          { app = "/Applications/Firefox.app"; }
          { app = "/Applications/Ghostty.app"; }
          { app = "/Applications/Obsidian.app"; }
        ];
      };

      trackpad = {
        Clicking = true;
        Dragging = true;
        TrackpadRightClick = true;
        TrackpadThreeFingerDrag = true;
      };

      finder = {
        AppleShowAllFiles = true;
        _FXSortFoldersFirst = true;
        FXRemoveOldTrashItems = true;
        NewWindowTarget = "Home";
      };

      NSGlobalDomain = {
        # swiping left or right with two fingers to navigate backward or forward
        AppleEnableSwipeNavigateWithScrolls = false;

        # Auto theme - switch light/dark
        AppleInterfaceStyleSwitchesAutomatically = true;

        # Text-Formatting
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
      };

      CustomUserPreferences = {
        "com.apple.SoftwareUpdate" = {
          AutomaticCheckEnabled = true;
          # Check for software updates daily
          ScheduleFrequency = 1;
          # Download newly available updates in background
          AutomaticDownload = 1;
          # Install System data files & security updates
          CriticalUpdateInstall = 1;
        };
      };
    };
  };
}
