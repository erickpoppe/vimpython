#!/bin/bash

# Configuration
PROJECT_DIR="$HOME/python_ide"
SCRIPT_FILE="$PROJECT_DIR/script.py"
OUTPUT_FILE="$PROJECT_DIR/output.txt"
EDITOR=$(which vim) 

# Create project directory if it doesn't exist
mkdir -p "$PROJECT_DIR"

# Main menu
while true; do
    clear
    echo "Simple Python IDE"
    echo "================="
    echo "1. Edit Python script"
    echo "2. Run Python script"
    echo "3. View output"
    echo "4. Exit"
    echo -n "Choose an option [1-4]: "
    
    read choice
    case $choice in
        1)
            $EDITOR "$SCRIPT_FILE"
            ;;
        2)
            echo "Running script..."
            python3 "$SCRIPT_FILE" > "$OUTPUT_FILE" 2>&1
            echo "Execution complete. Check output in menu option 3"
            read -p "Press enter to continue..."
            ;;
        3)
            clear
            echo "Last execution output:"
            echo "----------------------"
            cat "$OUTPUT_FILE"
            read -p "Press enter to continue..."
            ;;
        4)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option!"
            read -p "Press enter to continue..."
            ;;
    esac
done
