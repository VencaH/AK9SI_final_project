{
  description = "A basic Rust devshell for NixOS users";

  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url  = "github:numtide/flake-utils";
    nix-filter.url = "github:numtide/nix-filter";
    };

  outputs = { self, nixpkgs, rust-overlay, flake-utils, nix-filter, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
        rustHelper= pkgs.rustPlatform;
        sources = {
          rust = nix-filter.lib {
            root = ./.;
            include = [
              ./Cargo.lock
              (nix-filter.lib.inDirectory "src")
              (nix-filter.lib.inDirectory "tests")
              (nix-filter.lib.matchExt "toml")
              (nix-filter.lib.matchExt "lock")
            ];
          };
        };
      in
      with pkgs;
      {
        devShells.default = mkShell {
          buildInputs = [
            openssl
            pkg-config
            cacert
            cargo-make
            cargo-bump
            trunk
            fontconfig
            fermyon-spin
            (rust-bin.selectLatestNightlyWith( toolchain: toolchain.default.override {
              extensions= [ "rust-src" "rust-analyzer" ];
              targets = [ 
                "wasm32-unknown-unknown" 
                "wasm32-wasip1"
                ];
            }))
          ] ++ pkgs.lib.optionals pkg.stdenv.isDarwin [
            darwin.apple_sdk.frameworks.SystemConfiguration
          ];

        };
      }
    );
}
