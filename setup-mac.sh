
if [ "$(uname)" != "Darwin" ]; then
  echo "This system is not a macOS system. Exiting"
  exit 1
fi

echo "Running installation"

echo "Checking for homebrew"
if ! type "brew" > /dev/null; then
  echo "homebrew not found. Installing...."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew already installed ✅"
fi

echo "Installing raycast"
brew install --cask raycast

echo "Checking for sdkman"
if ! type "sdk" > /dev/null; then
  echo "sdkman not found. Installing...."
  curl -s "https://get.sdkman.io" | bash
else
  echo "sdkman already installed ✅"
fi

echo "Checking for bat"
if ! type "bat" > /dev/null; then
  echo "bat not found. Installing...."
  brew install bat
else
  echo "bat already installed ✅"
fi

echo "Running vim installation script"
./dotvim/install.sh
echo "Done!"

echo "Installing zsh config"
./install-zshrc.sh

echo "✨ Installation complete ✨"
