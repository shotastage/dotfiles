#!/usr/bin/env bash

# Temporary directory check and create
if [ -e .application_install_tmp/ ]; then
  echo "Temporary directory is already exists."
  rm -rf .application_install_tmp/
else
  mkdir .application_install_tmp/
fi

# Move to working directory
cd .application_install_tmp/



function install_vscode {
  if [ -e /Applications/Visual\ Studio\ Code.app/ ]; then
    return
  fi

  echo "Downloading Visual Studio Code..."
  curl -O https://az764295.vo.msecnd.net/stable/a622c65b2c713c890fcf4fbf07cf34049d5fe758/VSCode-darwin-stable.zip > /dev/null
  echo "Unzipping Visual Stuudio Code..."
  unzip VSCode-darwin-stable.zip > /dev/null
  echo "Installing..."
  mv ./Visual\ Studio\ Code.app /Applications/
}


function install_postgres {
  if [ -e /Applications/Postgres.app/ ]; then
    return
  fi

  echo "Downloading Postgress.app ..."
  curl -sLJO https://github.com/PostgresApp/PostgresApp/releases/download/v2.2.3/Postgres-2.2.3-11.dmg
  echo "Mounting DMG file..."
  hdiutil mount Postgres-2.2.3-11.dmg > /dev/null
  echo "Installing..."
  cp -r  /Volumes/Postgres-2.2.3/Postgres.app /Applications/Postgres.app/
  echo "Unmounting..."
  hdiutil unmount /Volumes/Postgres-2.2.3/ > /dev/null
}


function install_virtualbox {
  if [ -e /Applications/VirtualBox.app/ ]; then
    return
  fi
  echo "Downloading VirtualBox..."
  curl -O https://download.virtualbox.org/virtualbox/6.0.8/VirtualBox-6.0.8-130520-OSX.dmg > /dev/null
  echo "Mounting DMG file..."
  hdiutil mount VirtualBox-6.0.8-130520-OSX.dmg > /dev/null
  echo "Installing..."
  sudo installer -pkg /Volumes/VirtualBox/VirtualBox.pkg -target "/Volumes/Macintosh HD"
  echo "Unmounting..."
  hdiutil unmount /Volumes/VirtualBox/ > /dev/null
}


function setup_homebrew {
  echo "Installing Homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update && brew upgrade
}

install_vscode
install_postgres
install_virtualbox
setup_homebrew

echo "Cleaning..."
cd ..
rm -rf .application_install_tmp/
