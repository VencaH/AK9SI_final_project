{
  description = "Basic python flake";

  inputs  = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
  flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    with pkgs;
    {
      
      devShells.default = mkShell {
        buildInputs = [
          python3
        ];
        packages = [
          (python3.withPackages (python-pkgs: [
            python-pkgs.pip
            python-pkgs.python-lsp-server
            python-pkgs.pytest
            python-pkgs.fastapi
          ]))
        ];
      };
    }
  );
}
