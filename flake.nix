{
  description = "CLI tool to convert Chrome DevTools recordings into Akeyless custom rotator webhook scripts";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    substrate = {
      url = "github:pleme-io/substrate";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, substrate, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
      mkGoTool = (import "${substrate}/lib/go-tool.nix").mkGoTool;
    in {
      packages.default = mkGoTool pkgs {
        pname = "akeyless-ui-webhook-builder";
        version = "0.0.0-dev";
        src = self;
        vendorHash = "sha256-Dec/fOBBnyIBP4myS62koEBFXTxGrRkYa724qmuHFYE=";
        description = "CLI tool to convert Chrome DevTools recordings into Akeyless custom rotator webhook scripts";
        homepage = "https://github.com/pleme-io/akeyless-ui-webhook-builder";
      };

      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [ go gopls gotools ];
      };
    });
}
