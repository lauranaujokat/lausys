{
  libs,
  pkgs,
  inputs,
  ...
}: {
  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      shuffle # shuffle+ (special characters are sanitized out of extension names)
      songStats
      wikify
      skipStats
      trashbin
    ];
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "macchiato";
  };
}
