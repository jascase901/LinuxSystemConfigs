{pkgs,...}:

{
  environment.systemPackages = let
    vimPackages = import ./vim/vimPackages.nix pkgs;
    globalPackages = with pkgs; [ 
      firefox
      git
      tmux
      meld
      nodePackages.jshint
      python33Packages.scipy
      python34Packages.ipython
    ];

  in
    vimPackages ++ globalPackages;
}

