{ config, pkgs, ... }:
{
  # System Defaults
  system.defaults = {
    # Dock Settings
    dock = {
      autohide = true;
      persistent-apps = [
        "/Applications/Alacritty.app"
        "/Applications/Firefox.app"
        "/Applications/Obsidian.app"
        "/Applications/Zed.app"
      ];
      show-recents = false;
    };

    # Finder Settings
    finder = {
      FXPreferredViewStyle = "clmv"; # Column view
      AppleShowAllExtensions = true;
      ShowExternalHardDrivesOnDesktop = false;
      ShowRemovableMediaOnDesktop = false;
      ShowHardDrivesOnDesktop = false;
      ShowPathbar = true;
    };

    # Login Window Settings
    loginwindow = {
      GuestEnabled = false;
      SHOWFULLNAME = true;
    };

    # Global Domain Settings
    NSGlobalDomain = {
      AppleICUForce24HourTime = true;
      AppleInterfaceStyleSwitchesAutomatically = true;
      AppleKeyboardUIMode = 3;
      KeyRepeat = 5;
    };
  };

  # Additional useful system defaults you might want to consider
  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true; # Optional: Remap Caps Lock to Escape
  };

  # System activation scripts
  system.activationScripts.postActivation.text = ''
    # Restart Dock
    /usr/bin/killall Dock

    # Restart Finder
    /usr/bin/killall Finder
  '';
}
