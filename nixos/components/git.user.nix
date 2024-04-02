{pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "Laura Naujokat";
    userEmail = "lauranaujokat@tutanota.de";
    aliases = {
      ci = "commit";
      co = "checkout";
      s = "status";
    };
    extraConfig = {
      credential.helper = "${
        pkgs.git.override {withLibsecret = true;}
      }/bin/git-credential-libsecret";
    };
  };
}
