{ pkgs }:

let
  # this is the vimrc.nix from above
  vimrc   = pkgs.callPackage ./vimrc.nix {};

  # and the plugins.nix from above
  plugins = pkgs.callPackage ./vimPlugins.nix {};
in
{
  customRC = vimrc;
  vam = {
    knownPlugins = pkgs.vimPlugins // plugins;

    pluginDictionaries = [
      # from pkgs.vimPlugins
      { name = "youcompleteme"; }

      { name = "nerdtree"; }

      { name = "syntastic"; }


      # from our own plugin package set
      { name = "vim-trailing-whitespace"; }
    ];
  };
}
