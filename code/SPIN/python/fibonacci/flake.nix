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
          fermyon-spin
          python3
        ];
        packages = [
          (python3.withPackages (python-pkgs: [
            python-pkgs.pip
            python-pkgs.python-lsp-server
            python-pkgs.pytest
            python-pkgs.fastapi
            python-pkgs.virtualenv
          ]))
        ];
        shellHook = ''
            spin templates install --git https://github.com/fermyon/spin-python-sdk --update
            virtualenv venv
            source venv/bin/activate
            pip install componentize-py==0.16.0 spin-sdk==3.3.0 mypy==1.8.0
        '';
      };
    }
  );
}
