#!/bin/bash

clear
echo "=============================="
echo " project-scaffold-gen-i"
echo "=============================="
echo
read -rp "What is the name of the project? " project_name

# Normalize name by replacing spaces with hyphens
project_name="${project_name// /-}"

# Create root directory
mkdir -p "$project_name" || { echo "Failed to create root directory."; exit 1; }
cd "$project_name" || { echo "Failed to enter project directory."; exit 1; }

# Prompt for project type
echo
echo "Select the type of project:"
echo "[1] Lab"
echo "[2] Coding Project"
echo "[3] General"
read -rp "Enter choice (1/2/3): " project_type

case "$project_type" in
  1)
    echo "Lab project selected."
    read -rp "Include diagrams/ folder? (y/n): " diagrams
    [[ $diagrams =~ ^[Yy]$ ]] && mkdir -p diagrams

    read -rp "Include images/ folder? (y/n): " images
    [[ $images =~ ^[Yy]$ ]] && mkdir -p images
    ;;

  2)
    echo "Coding project selected."
    read -rp "Include assets/ folder? (y/n): " assets
    [[ $assets =~ ^[Yy]$ ]] && mkdir -p assets

    read -rp "Include docs/ folder? (y/n): " docs
    [[ $docs =~ ^[Yy]$ ]] && mkdir -p docs

    read -rp "Include scripts/ folder? (y/n): " scripts
    [[ $scripts =~ ^[Yy]$ ]] && mkdir -p scripts

    read -rp "Include tests/ folder? (y/n): " tests
    [[ $tests =~ ^[Yy]$ ]] && mkdir -p tests

    read -rp "Generate additional .md file? (y/n): " extra_md
    if [[ $extra_md =~ ^[Yy]$ ]]; then
      read -rp "Name of the .md file (without extension): " md_name
      touch "${md_name}.md"
    fi
    ;;

  3)
    echo "General project selected. Skipping predefined folders."
    ;;

  *)
    echo "Invalid project type selected. Exiting."
    exit 1
    ;;
esac

# Ask to generate README.md for all project types
read -rp "Generate README.md? (y/n): " readme
[[ $readme =~ ^[Yy]$ ]] && touch README.md

# Universal custom addition loop
while true; do
  echo
  read -rp "Any last files or folders to create? (y/n to finish): " final_choice
  if [[ $final_choice =~ ^[Nn]$ ]]; then
    break
  fi

  read -rp "File [1] or Folder [2]? " type_choice
  if [[ $type_choice == 1 ]]; then
    read -rp "File name (without extension): " file_name
    read -rp "File type/extension (e.g., .txt, .md, .sh): " file_ext
    read -rp "Where? $project_name/" sub_path
    mkdir -p "$sub_path"
    touch "$sub_path/${file_name}${file_ext}"
    echo "Created file: $sub_path/${file_name}${file_ext}"
  elif [[ $type_choice == 2 ]]; then
    read -rp "Folder name: " folder_name
    read -rp "Where? $project_name/" sub_path
    mkdir -p "$sub_path/$folder_name"
    echo "Created folder: $sub_path/$folder_name"
  else
    echo "Invalid choice. Skipping."
  fi
done

echo
echo "Scaffolding for \"$project_name\" complete!"
