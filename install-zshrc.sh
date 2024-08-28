echo "Cloning zsh plugins:"

git clone git@github.com:grigorii-zander/zsh-npm-scripts-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-npm-scripts-autocomplete
git clone https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-git-prompt/zsh-git-prompt.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-git-prompt
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~.oh-my-zsh/custom}/plugins/you-should-use
git clone https://github.com/fdellwing/zsh-bat.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-bat

if [ "$(uname)" == "Darwin" ]; then
  echo "Installing bat:"
  brew install bat
else
  echo "Not running on a macOS system. You will have to install bat manually"
fi

echo "Overwriting old .zshrc with the new one"
cp .zshrc ~/.zshrc

echo "✨ Installation complete ✨"
