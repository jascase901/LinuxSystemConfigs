{pkgs,...}:

{
 environment.systemPackages = with pkgs; [
    firefox
    git
    tmux
    vim
    wget 
    zsh
 ];
}
