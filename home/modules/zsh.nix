{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.starship.enable = true;

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # Adding custom aliases
    shellAliases = {
      # Alias to update your nix-darwin configuration
      "darwin-update" = "darwin-rebuild switch --flake ~/.config/nix-darwin";

      # GitHub CLI aliases
      "gh-pr-create" = "gh pr create";
      "gh-pr-checkout" = "gh pr checkout";
      "gh-issue-create" = "gh issue create";
      "gh-issue-view" = "gh issue view";
    };
  };
}
