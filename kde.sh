#!/bin/bash

# Variables
TITLE="KDE CONFIGURATOR"
RULES_FILE="$HOME/.config/kwinrulesrc"

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
      cp ~/.zshrc ./config/zshrc
      ;;
    2)
      cp ./config/zshrc ~/.zshrc
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