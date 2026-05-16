# Shell Tools Installer 🚀

A lightweight, automated deployment script to configure **[zoxide](https://github.com/ajeetdsouza/zoxide)** and **[fzf](https://github.com/junegunn/fzf)**. 

Designed for efficiency and built to respect user freedom, this tool optimizes your terminal workflow by enabling lightning-fast directory navigation and interactive fuzzy finding. It securely detects and injects the necessary configurations into `.zshrc` and `.bashrc` without duplicating entries.

## Features

* **Zoxide:** A smarter, faster `cd` command that remembers your most used directories based on frequency.
* **Fzf:** A general-purpose command-line fuzzy finder for files, command history, processes, and more.
* **Idempotent Execution:** Safe to run multiple times; it will only append configurations if they don't already exist.
* **Multi-Shell Support:** Configures both Zsh and Bash environments seamlessly.

## Prerequisites

This script utilizes the `apt` package manager and is intended for Debian-based distributions (e.g., Debian, Ubuntu, Kali Linux).

## Installation

Clone the repository, make the script executable, and run it:

```bash
git clone [https://github.com/FDvck/shell-tools-installer.git](https://github.com/FDvck/shell-tools-installer.git)
cd shell-tools-installer
chmod +x install-shell-tools.sh
./install-shell-tools.sh
