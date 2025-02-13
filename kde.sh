#!/bin/bash

# Variables
TITLE="KDE CONFIGURATOR"

# Menu
menu(){
  clear
  echo "=== $TITLE ==="
  echo "1. KWin Rules"
  echo "2. Git Config"
  echo "3. ZSH Config"
  echo "4. Cursor Config"
  echo "0. Exit"
}

sub_menu(){
  echo "=== $1 ==="
  echo "1. <-"
  echo "2. ->"
}

# 1. KWin Rules
RULES_FILE="$HOME/.config/kwinrulesrc"
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

# 2. Git Config ---------------------------------------------------------------
git_config(){
  sub_menu "Git Config"
  read -p "Select an option: " option

  case $option in
    1)
      cp ~/.gitconfig config/gitconfig
      ;;
    2)
      cp config/gitconfig ~/.gitconfig
      ;;
  esac
  read -p "Done..."
}

# 3. ZSH Config ---------------------------------------------------------------
zsh_config(){

  ZSH_CONFIG="$HOME/.zshrc"
  ZSH_FOLDER="$HOME/.oh-my-zsh"
  ZSH_CUSTOM="$ZSH_FOLDER/custom"

  sub_menu "ZSH Config"
  read -p "Select an option: " option

  case $option in
    1)
      cp $ZSH_CONFIG config/zshrc
      tar -caf data/plugins.tar.gz -C $ZSH_CUSTOM plugins
      tar -caf data/themes.tar.gz -C $ZSH_CUSTOM themes
      ;;
    2)
      cp config/zshrc $ZSH_CONFIG
      tar -xf data/plugins.tar.gz -C $ZSH_CUSTOM
      tar -xf data/themes.tar.gz -C $ZSH_CUSTOM
      ;;
  esac
  read -p "Done..."
}

# 4. VS Code Config ---------------------------------------------------------------
VS_CONFIG="$HOME/.config/Cursor/User/settings.json"
VS_SHORTCUTS="$HOME/.config/Cursor/User/keybindings.json"

cursor_config(){
  sub_menu "Cursor Config"
  read -p "Select an option: " option

  case $option in
    1)
      cp $VS_CONFIG config/vscode.json
      cp $VS_SHORTCUTS shortcuts/vscode.json
      ;;
    2)
      cp config/vscode.json $VS_CONFIG
      cp shortcuts/vscode.json $VS_SHORTCUTS
      ;;
  esac
  read -p "Done..."
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
          4)
              cursor_config
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