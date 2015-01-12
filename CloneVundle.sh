if [! -d "~/.vim/bundle" ]; then
  mkdir -p ~/.vim/bundle
  echo "Creating Vundle Directory"
  fi
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
