#!/bin/bash

# Variables
TITLE="KDE CONFIGURATOR"
RULES_FILE="$HOME/.config/kwinrulesrc"

menu(){
  clear
  echo "=== $TITLE ==="
  echo "1. KWin Rules"
  echo "2. Shortcuts"
  echo "0. Exit"
}

sub_menu(){
  echo "=== $1 ==="
  echo "1. Push"
  echo "2. Pull"
}

kwin_rules(){
  clear
  while true; do
    sub_menu "KWin Rules"
    read -p "Select an option: " option

    case $option in
      1)
        echo "Push"
        ;;
      2)
        echo "Pull"
        ;;
      0)
        echo "Exiting..."
        return 0
        ;;
      *)
        echo "Invalid option"
        ;;
    esac
  done
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
              echo "Has seleccionado la opción 1"
              kwin_rules
              ;;
          2)
              echo "Has seleccionado la opción 2"
              read -p "Presiona Enter para continuar..."
              ;;
          3)
              echo "Has seleccionado la opción 3"
              read -p "Presiona Enter para continuar..."
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