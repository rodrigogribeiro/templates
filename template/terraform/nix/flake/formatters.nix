{inputs, ...}: {
  # NOTE: `treefmt-nix` provides an options module that's compatible with
  # `flake-parts`.
  #
  # Since this is logically coupled to autoformatting, i'm importing it here
  # rather than the top-level `flake.nix` file but there isn't strictly a
  # reason to do it one way versus the other.
  imports = [inputs.treefmt-nix.flakeModule];
  perSystem.treefmt = {
    # Search for the `flake.nix` file to determine the project root directory.
    # search for 'flake.nix' to determine the project root directory.
    projectRootFile = "flake.nix";
    programs = {
      deadnix.enable = true;
      alejandra.enable = true;
      terraform.enable = true;
    };
  };
}
