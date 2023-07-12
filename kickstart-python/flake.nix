{
  description = "Description for the project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    devenv.url = "github:cachix/devenv";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [inputs.devenv.flakeModule];

      debug = true;

      systems = [
        "x86_64-linux"
        "i686-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        ...
      }: let
        # Pro-tip:
        # Refactor into additional variables and definitions here to keep the core logic below clean
        scripts = {
          hello.exec = ''
            echo "Hello world"
          '';
        };
        packages = with pkgs; [micromamba];
        devcontainer = {
          enable = true;

          settings.updateContentCommand = "nix develop --impure";

          # Add extension IDs here (Extension>Copy ID in VSCode)
          settings.customizations.vscode.extensions = ["charliermarsh.ruff" "kamadorueda.alejandra" "mkhl.direnv"];
        };
      in {
        devenv.shells.default = {
          name = "kickstart-python";
          scripts = scripts;
          packages = packages;

          enterShell = ''
            export MAMBA_ROOT_PREFIX="$(pwd)/.mamba"
            if ! [ -d "$MAMBA_ROOT_PREFIX" ]; then
              micromamba create -p "$MAMBA_ROOT_PREFIX"
              micromamba install -y -p "$MAMBA_ROOT_PREFIX" -f python-environment.yaml
            fi
            eval "$(micromamba shell hook --shell=posix)"
            micromamba activate
          '';
        };
      };
    };
}
