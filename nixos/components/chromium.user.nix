{pkgs, ...}: {
  programs.chromium = {
    enable = true;
    extensions = [
      {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # ublock
      {id = "clngdbkpkpeebahjckkjfobafhncgmne";} # stylus
      {id = "mnjggcdmjocbbbhaepdhchncahnbgone";} # sponsorblock yt
      {id = "cmpdlhmnmjhihmcfnigoememnffkimlk";} # catppuccin theme chromium
      {id = "oboonakemofpalcgghocfoadofidjkkk";} # keepassxc
      {id = "nngceckbapebfimnlniiiahkandclblb";} # bitwarden
    ];
  };
}
