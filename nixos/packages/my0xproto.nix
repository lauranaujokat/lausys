{
  stdenv,
  fetchFromGitHub,
  pkgs,
}: {
  my0xproto = stdenv.mkDerivation {
    pname = "my0xproto";
    version = "1.0";
    dontBuild = true;
    installPhase = ''
      runHook preInstall
      ${pkgs.nerd-font-patcher}/bin/nerd-font-patcher $src/fonts/0xProto-Regular.ttf -out ./0xProtoPatched -c
      ${pkgs.nerd-font-patcher}/bin/nerd-font-patcher $src/fonts/0xProto-Italic.ttf -out ./0xProtoPatched -c
      ${pkgs.nerd-font-patcher}/bin/nerd-font-patcher $src/fonts/0xProto-Bold.ttf -out ./0xProtoPatched -c
      ${pkgs.nerd-font-patcher}/bin/nerd-font-patcher $src/fonts/0xProto-Regular.ttf -out ./0xProtoPatched -c -s
      ${pkgs.nerd-font-patcher}/bin/nerd-font-patcher $src/fonts/0xProto-Italic.ttf -out ./0xProtoPatched -c -s
      ${pkgs.nerd-font-patcher}/bin/nerd-font-patcher $src/fonts/0xProto-Bold.ttf -out ./0xProtoPatched -c -s
      install -Dm644 ./0xProtoPatched/*ttf -t $out/share/fonts/truetype
      runHook postInstall
    '';
    src = fetchFromGitHub {
      owner = "0xType";
      repo = "0xProto";
      rev = "5548966";
      sha256 = "sha256-96y5WfESnxvbeW7uRCDIN3MegxNfd3r3IgFlFpJVz4M=";
    };
  };
}
