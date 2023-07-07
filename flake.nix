{
  description = "Templates";

  outputs = { self }: {
    templates = {
      kickstart-python = {
        path = ./kickstart-python;
        description =
          "👟 A fully cross-platform Nix Flake Template based on Devenv and Micromamba to kick-start your Python projects 👟";
      };
    };
    defaultTemplate = self.templates.kickstart-python;
  };
}
