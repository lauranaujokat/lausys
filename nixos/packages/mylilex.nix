{
  stdenv,
  fetchFromGitHub,
  pkgs,
}: {
  mylilex = stdenv.mkDerivation {
    pname = "mylilex";
    version = "1.0";
    dontBuild = true;
    installPhase = ''
      runHook preInstall
      ${pkgs.nerd-font-patcher}/bin/nerd-font-patcher $src/fonts/ttf/Lilex-Bold.ttf -out ./LilexPatched -c
      ${pkgs.nerd-font-patcher}/bin/nerd-font-patcher $src/fonts/ttf/Lilex-BoldItalic.ttf -out ./LilexPatched -c
      ${pkgs.nerd-font-patcher}/bin/nerd-font-patcher $src/fonts/ttf/Lilex-ExtraLight.ttf -out ./LilexPatched -c
      ${pkgs.nerd-font-patcher}/bin/nerd-font-patcher $src/fonts/ttf/Lilex-ExtraLightItalic.ttf -out ./LilexPatched -c
      ${pkgs.nerd-font-patcher}/bin/nerd-font-patcher $src/fonts/ttf/Lilex-Italic.ttf -out ./LilexPatched -c
      ${pkgs.nerd-font-patcher}/bin/nerd-font-patcher $src/fonts/ttf/Lilex-Medium.ttf -out ./LilexPatched -c
      ${pkgs.nerd-font-patcher}/bin/nerd-font-patcher $src/fonts/ttf/Lilex-Regular.ttf -out ./LilexPatched -c
      ${pkgs.nerd-font-patcher}/bin/nerd-font-patcher $src/fonts/ttf/Lilex-Thin.ttf -out ./LilexPatched -c
      ${pkgs.nerd-font-patcher}/bin/nerd-font-patcher $src/fonts/ttf/Lilex-ThinItalic.ttf -out ./LilexPatched -c
      ${pkgs.nerd-font-patcher}/bin/nerd-font-patcher $src/fonts/ttf/Lilex-Bold.ttf -out ./LilexPatched -c -s
      ${pkgs.nerd-font-patcher}/bin/nerd-font-patcher $src/fonts/ttf/Lilex-BoldItalic.ttf -out ./LilexPatched -c -s
      ${pkgs.nerd-font-patcher}/bin/nerd-font-patcher $src/fonts/ttf/Lilex-ExtraLight.ttf -out ./LilexPatched -c -s
      ${pkgs.nerd-font-patcher}/bin/nerd-font-patcher $src/fonts/ttf/Lilex-ExtraLightItalic.ttf -out ./LilexPatched -c -s
      ${pkgs.nerd-font-patcher}/bin/nerd-font-patcher $src/fonts/ttf/Lilex-Italic.ttf -out ./LilexPatched -c -s
      ${pkgs.nerd-font-patcher}/bin/nerd-font-patcher $src/fonts/ttf/Lilex-Medium.ttf -out ./LilexPatched -c -s
      ${pkgs.nerd-font-patcher}/bin/nerd-font-patcher $src/fonts/ttf/Lilex-Regular.ttf -out ./LilexPatched -c -s
      ${pkgs.nerd-font-patcher}/bin/nerd-font-patcher $src/fonts/ttf/Lilex-Thin.ttf -out ./LilexPatched -c -s
      ${pkgs.nerd-font-patcher}/bin/nerd-font-patcher $src/fonts/ttf/Lilex-ThinItalic.ttf -out ./LilexPatched -c -s
      install -Dm644 ./LilexPatched/*ttf -t $out/share/fonts/truetype
      runHook postInstall
    '';
    src = fetchFromGitHub {
      owner = "mishamyrt";
      repo = "Lilex";
      rev = "cc2552a";
      sha256 = "sha256-Ir5l1PVRGD5i/Wl900wlW1Arn9Aa/Q92wEumA8W9bu8=";
    };
  };
}
