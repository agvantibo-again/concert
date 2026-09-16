{
  nixpkgs,
  ...
}:
{
  # Build me with:
  # nix-build -E '(import ./xample.nix { nixpkgs = import <nixpkgs> {}; }).derivation'
  entrypoint = "bin/hello";
  derivation = nixpkgs.stdenv.mkDerivation {
    name = "xample";
    src = ./xample.c;
    dontUnpack = true;
    buildPhase = ''
      $CC $src -o xample
    '';
    installPhase = ''
      mkdir -p $out/bin
      cp xample $out/bin
    '';
  };
}
