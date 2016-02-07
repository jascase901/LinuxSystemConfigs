{ pkgs, fetchgit }:

let
  buildVimPlugin = pkgs.vimUtils.buildVimPluginFrom2Nix;
in {

  "vim-trailing-whitespace" = buildVimPlugin {
    name = "vim-trailing-whitespace";
    src = fetchgit {
      url = "https://github.com/bronson/vim-trailing-whitespace";
      rev = "d4ad27de051848e544e360482bdf076b154de0c1";
      sha256 = "594769a6f901407609b635a5041966456bfd91b13437169a4562857544e1dca3";
    };
    dependencies = [];
  };

  "vim-colorschemes" = buildVimPlugin{
    name = "vim-colorschemes";
    src = fetchgit {
      url = "https://github.com/flazz/vim-colorschemes.git";
      rev = "28a989b28457e38df620e4c7ab23e224aff70efe";
      sha256 = "1r9nmlw6ranl5xc3cx0knkmq90rcp6vlmrg2xib35h2dldsch22k";
    };
    dependencies = [];
  };

  # more?
}
