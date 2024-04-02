{
  stdenv,
  fetchFromGitHub,
}: {
  catppuccin-sddm = stdenv.mkDerivation rec {
    pname = "cattppuccin-sddm";
    version = "1.0";
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/sddm/themes/
      cp -aR $src/src/catppuccin-macchiato $out/share/sddm/themes/catppuccin-macchiato
    '';
    src = fetchFromGitHub {
      owner = "catppuccin";
      repo = "sddm";
      rev = "1a58b5c";
      sha256 = "sha256-cZuNQDXdWiE2eCf/bdGFYKM5SXrENxJere83SI47ol4=";
    };
  };
}
