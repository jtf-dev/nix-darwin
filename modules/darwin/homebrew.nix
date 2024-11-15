{ inputs, pkgs, ... }:

{
  # Homebrew configuration
  homebrew = {
    enable = true;
    brews = [
    "lazygit"
    ];
    casks = [

    # Browsers
    "firefox"
    "google-chrome"

    # Messaging

    # Dev
    "alacritty"
    "insomnia"
    "zed"

    # Graphics
    "figma"
    "drawio"

    # Mac Utilities
    "raycast"

    # Media
    "spotify"
    "vlc"

    # Office
    "obsidian"

    # Tools
    "1password"
    "the-unarchiver"
    ];

    # Homebrew activation options
    onActivation = {
        cleanup = "zap";
        autoUpdate = true;
        upgrade = true;
    };
  };

  # Users configuration (you should already have the user created)
  users.users.jtf-dev = {
    home = "/Users/jtf-dev";
  };
}
