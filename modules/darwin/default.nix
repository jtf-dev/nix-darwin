{ pkgs, config, self, ... }:

{
  # Import the homebrew.nix file
  imports = [
    ./homebrew.nix
    ./system.nix
  ];

  # Other system configurations
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = [ pkgs.vim ];
  services.nix-daemon.enable = true;
  nix.settings.experimental-features = "nix-command flakes";
  programs.zsh.enable = true;
  system.stateVersion = 5;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
