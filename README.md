# Project-Scaffold-Gen-I

`project-scaffold-gen-i` is a lightweight Bash-based CLI tool that generates a custom scaffold for new projects, labs, or general folders. It prompts the user for project-specific information and creates a clean folder and file structure based on the input.

This tool shows how Bash scripting can create practical and flexible solutions without extra complexity or dependencies. It's for developers, sysadmins, and technical professionals who want to quickly set up a project layout from the terminal.

## Features

- Interactive CLI workflow
- Supports three modes:
  - Lab
  - Coding Project
  - General (fully customizable)
- Auto-creates folders such as `docs/`, `src/`, `tests/`, `scripts/`, `images/`, and more
- Optionally generates `README.md` and other markdown files
- Final prompt loop allows unlimited custom files or folders with user-defined paths
- All output is sandboxed to the root project directory

## Example Usage

```bash
$ ./project-scaffold-gen.sh
==============================
 project-scaffold-gen-i
==============================

What is the name of the project? n-wrap

Select the type of project:
[1] Lab
[2] Coding Project
[3] General
Enter choice (1/2/3): 2

Include assets/ folder? (y/n): y
Include docs/ folder? (y/n): y
Include scripts/ folder? (y/n): n
Include tests/ folder? (y/n): y
Generate additional .md file? (y/n): y
Name of the .md file (without extension): changelog
Generate README.md? (y/n): y

Any last files or folders to create? (y/n to finish): y
File [1] or Folder [2]? 1
File name (without extension): device-roles
File type/extension (e.g., .txt, .md, .sh): .md
Where? n-wrap/ docs/

Any last files or folders to create? (y/n to finish): n

Scaffolding for "n-wrap" complete!
```

## Why This Exists

This script was created as part of a personal project to show what Bash scripting can do in a practical, real-world setting. It avoids unnecessary complexity, keeps the logic clear, and intends to be truly helpful for anyone managing technical projects from the terminal.

Whether you're starting a new lab, creating a tool, or organizing an idea, this script takes care of the basic structure. This way, you can focus on the real work.

## Requirements

- Bash (tested on Bash 5+)
- Unix-like system (Linux, macOS, WSL)

No external dependencies are required.

## License

MIT License
