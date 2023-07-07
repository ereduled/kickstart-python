# Kickstart-Python

![Python Badge](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Platform Badge](https://img.shields.io/badge/Platform-Multiplatform-green?style=for-the-badge)

Welcome to **Kickstart-Python** - A fully cross-platform Nix Flake Template based on Devenv and Micromamba to kick-start your Python projects. Our aim is to provide an environment that works seamlessly on all platforms where Nixpkgs and Conda-Forge are supported, making it particularly useful for a wide range of devices.

## 🌟 Features

- **Cross-platform**: It works seamlessly on all *nix platforms where Nixpkgs and Conda-Forge are supported. This means the same code works on aarch64
- **Cuda Support**: Using the different channels within Conda makes it much easier to find and pin proper versions of your packages, including specific cuda versions by using the official nvidia channels
- **Efficient package management**: By leveraging Micromamba, a faster and efficient version of the Conda package manager, the setup process is streamlined and quicker than ever.
- **Nix Flake Template**: The Nix Flake provides a reproducible and declarative configuration management, allowing your projects to run anywhere without worrying about system dependencies.


## ⚙ Powered by [devenv](https://github.com/cachix/devenv)
Complexity is inevitable as you develop your application. There's going to be environment variables and secrets, and specific one-off scripts that you might want to ship and maintain.
Devenv enables you to tackle the complexity by making it easy to benefit from all of the features of the Nix ecosystem like without having to become an expert in the Nix language. 

- This enables us to have a consistent developer environment, where user environment idiosyncrasies ("It works on my machine, weird it's not working on yours?!") are eliminated
- Does your program need a database like Redis or PostgreSQL to be already launched for it to work correctly? [We've got you covered](https://devenv.sh/services/#supported-services)
- There's quite a lot of interesting features like shell activation scripts and setting environment variables that makes it much easier to grapple with the complexity that creeps up on you in any codebase

## Pre-requisites
The Nix Package manager needs to be installed and available on the system.
This simply takes the running of a single command on most platforms.

Go [here](https://nixos.org/download.html) for the installation instructions

Install [Direnv](https://direnv.net/docs/installation.html) activated the current shell - Optional but highly recommended!

This enables the automatic shell activation feature so that you will enter the correct environment auto-magically upon `cd`ing to the project root!

## 🚀 Getting Started

1. **Instantiate the nix tamplate**
   ```shell
   nix flake init -t github:ereduled/kickstart-python
   ```
2. **Allow direnv**

   To automatically load and unload environment variables based on the current directory, run:
   ```shell
   direnv allow
   ```
3. **Start developing!**

   You're now ready to start your Python project with a reproducible and cross-platform setup!
---

Built with ❤️ for Python developers.
