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

  outputs = inputs: (import "${inputs.substrate}/lib/repo-flake.nix" {
    inherit (inputs) nixpkgs flake-utils;
  }) {
    self = inputs.self;
    language = "go";
    builder = "tool";
    pname = "akeyless-ui-webhook-builder";
    vendorHash = "sha256-Dec/fOBBnyIBP4myS62koEBFXTxGrRkYa724qmuHFYE=";
    description = "CLI tool to convert Chrome DevTools recordings into Akeyless custom rotator webhook scripts";
    homepage = "https://github.com/pleme-io/akeyless-ui-webhook-builder";
  };
}
