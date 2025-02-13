#!/bin/bash

# Variables
TITLE="KDE CONFIGURATOR"

RULES_FILE="$HOME/.config/kwinrulesrc"

ZSH_CONFIG="$HOME/.zshrc"
ZSH_FOLDER="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$ZSH_FOLDER/custom"

menu(){
  clear
  echo "=== $TITLE ==="
  echo "1. KWin Rules"
  echo "2. Git Config"
  echo "3. ZSH Config"
  echo "0. Exit"
}

sub_menu(){
  echo "=== $1 ==="
  echo "1. <-"
  echo "2. ->"
}

kwin_rules(){
  sub_menu "KWin Rules"
  read -p "Select an option: " option

  case $option in
    1)
      echo "Push"
      ;;
    2)
      echo "Pull"
      ;;
    *)
      return 0
      ;;
  esac
  read -p "Done..."
}

zsh_config(){
  sub_menu "ZSH Config"
  read -p "Select an option: " option

  case $option in
    1)
      cp $ZSH_CONFIG ./config/zshrc
      tar -caf ./data/plugins.tar.gz -C $ZSH_CUSTOM plugins
      tar -caf ./data/themes.tar.gz -C $ZSH_CUSTOM themes
      ;;
    2)
      cp ./config/zshrc $ZSH_CONFIG
      tar -xf ./data/plugins.tar.gz -C $ZSH_CUSTOM
      tar -xf ./data/themes.tar.gz -C $ZSH_CUSTOM
      ;;
  esac
  read -p "Done..."
}

git_config(){
  sub_menu "Git Config"
  read -p "Select an option: " option

  case $option in
    1)
      cp ~/.gitconfig ./config/gitconfig
      ;;
    2)
      cp ./config/gitconfig ~/.gitconfig
      ;;
    *)
      return 0
      ;;
  esac
  read -p "Done..."
}

shortcuts(){
  clear
  echo "Shortcuts"
}

main(){
  while true; do
      menu
      read -p "Select an option: " option

      case $option in
          1)
              kwin_rules
              ;;
          2)
              git_config
              ;;
          3)
              zsh_config
              ;;
          0)
              echo "Exiting..."
              exit 0
              ;;
          *)
              echo "Invalid option"
              read -p "Press Enter to continue..."
              ;;
      esac
  done
}

main