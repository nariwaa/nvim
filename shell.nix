{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    gcc
    cargo
    gcc
    go
    lua
  ];

  shellHook = ''
    nvim
  '';
}
