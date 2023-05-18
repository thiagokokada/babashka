{ pkgs ? import <nixpkgs> { }, ... }:

let
  # Ensure we are using JDK11, since we are going to compile with native image
  # from GraalVM 11
  jdk = pkgs.jdk11;
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    nixUnstable
    jdk
    (clojure.override { inherit jdk; })
    (leiningen.override { inherit jdk; })
  ];
}
