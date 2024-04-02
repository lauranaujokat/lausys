{
  libs,
  pkgs,
  ...
}: {
  services.picom = {
    enable = true;
    backend = "glx";
    settings = {
      blur = {
        method = "box";
        size = 5;
        strength = 10;
      };
    };
  };
}
