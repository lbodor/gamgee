{ dream2nix, lib, ... }:
{
  imports = [ dream2nix.modules.dream2nix.WIP-haskell-cabal ];

  name = "gamgee";
  version = "1.2.2-lbodor";

  deps =
    { nixpkgs, ... }:
    {
      haskell-compiler = nixpkgs.haskell.compiler.ghc810;
    };

  mkDerivation = {
    src = lib.cleanSourceWith {
      src = lib.cleanSource ./.;
      filter =
        name: type:
        let
          baseName = baseNameOf (toString name);
        in
        !(lib.hasSuffix ".nix" baseName || baseName == "Makefile");
    };
  };
}
