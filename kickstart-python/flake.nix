{
  description = "Description for the project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    devenv.url = "github:cachix/devenv";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {

      imports = [
        inputs.devenv.flakeModule
      ];

      debug = true;

      systems = ["x86_64-linux" "i686-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin"];

      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        ...
      }: let
        # Pro-tip Refactor into additional variables and definitions here to keep the core logic below clean
        # Currently simply sets variable _ = 0 which does nothing
        _ = 0;
      in {
        devenv.shells.default = {
          name = "kickstart-python";
          devcontainer = {
            # Enable to generate the .devcontainer.json file
            enable = false;

            settings.updateContentCommand = "nix develop --impure";

            # Can add various extensions to your Vscode Devcontainer here
            settings.customizations.vscode.extensions = [
              "charliermarsh.ruff"
              "kamadorueda.alejandra"
              "mkhl.direnv"
            ];
          };

          packages = with pkgs; [
            micromamba
          ];

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
