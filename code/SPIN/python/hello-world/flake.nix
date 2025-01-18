{
  description = "Basic python flake";

  inputs  = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { self, nixpkgs, flake-utils, rust-overlay, ... }:
  flake-utils.lib.eachDefaultSystem (system:
    let
      overlays = [(import rust-overlay)];
      pkgs = import nixpkgs {
        inherit system overlays;
      };
      rust = pkgs.rust-bin.selectLatestNightlyWith (toolchain: toolchain.default.override {
        extensions = ["rust-src"];
      } );
        maturin = pkgs.python3Packages.buildPythonPackage rec {
          pname = "maturin";
          version = "1.8.1";
          pyproject = true;
          src = pkgs.python3Packages.fetchPypi {
            inherit pname version;
            # hash = "sha256-49cd964aabf59f8b0a6969f9860d2cdf194ac331529caae14c884f5659568857";
            hash="sha256-Sc2WSqv1n4sKaWn5hg0s3xlKwzFSnKrhTIhPVllWiFc=";
          };
          build-system = with pkgs.python3Packages; [
            setuptools
            setuptools-scm
            setuptools-rust
          ];
          dependencies = with pkgs.python3Packages; [
            setuptools
            setuptools-rust
          ];
          nativeBuildInputs = [
            rust
          ];
        };
      componentize-py = pkgs.python3Packages.buildPythonPackage rec {
        pname = "componentize-py";
        version = "0.16.0";
        pyproject = true;
        propagatedBuildInputs = [
          maturin
        ];
        src = pkgs.fetchurl {
            url = "https://github.com/bytecodealliance/componentize-py/releases/download/canary/componentize_py-0.16.0.tar.gz";
            # sha256 = "2823e5f3abf7a4eaf993d0841d8e7888f13d3b46a8e42230e044d64b49311e57";
            hash = "sha256-LSQUle18ZfwkfY3CCQuw0KpAjEppyQ2oz8WQ2n2Hnmo=";
        };
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
            componentize-py
          ]))
        ];
      };
    }
  );
}
