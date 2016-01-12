git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
if [ -f $HOME/.vimrc ];
then 
   echo "File ~/.vimrc exists copying back to $HOME/.vimrc.backup"
   cp $HOME/.vimrc $HOME/.vimrc.back
fi
cp .vimrc $HOME/.vimrc

echo "Vundle Install  complete open vim and run :PluginInstall to download rest of plugins from git"

if [ -f $HOME/.tmux.conf ];
then 
   echo "File ~/.tmux.conf exists copying back to $HOME/.tmux.conf.backup"
   cp $HOME/.tmux.conf $HOME/.tmux.conf.back
fi
cp .tmux.conf $HOME/.tmux.conf
