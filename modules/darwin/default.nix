{ pkgs, config, self, ... }:

{
  # Import the homebrew.nix file
  imports = [
    ./homebrew.nix
    ./system.nix
  ];

  # Nix Package Management
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
      vim
      ripgrep

      # Nix lsp tools
      alejandra
      nixd
    ];

  # Other system configurations
  services.nix-daemon.enable = true;
  nix = {
    gc.automatic = true;
    optimise.automatic = true;
    settings = {
        experimental-features = "nix-command flakes";
        };
    };
  programs.zsh.enable = true;
  system.stateVersion = 5;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
