{pkgs,...}:

{
  environment.systemPackages = let
    vimPackages = import ./vim/vimPackages.nix pkgs;
    globalPackages = with pkgs; [ 
      firefox
      git
      tmux
      meld
    ];

  in
    vimPackages ++ globalPackages;
}

