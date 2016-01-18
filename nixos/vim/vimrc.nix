{ stdenv, writeText }:

let
    generic     = builtins.readFile ./vimrc/general.vim;
    textediting = builtins.readFile ./vimrc/textediting.vim;
    # ... more here

    plug = import ./vimrc/pluginconfigurations.nix;
in

''
    ${generic}

    ${textediting}

    " ... more here

    ${plug}
''
