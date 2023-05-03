{
  description = "A flake for building Hello World";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-22.11;

  outputs = { self, nixpkgs }: {

    # defaultPackage.aarch64-darwin =
    #   # Notice the reference to nixpkgs here.
    #   with import nixpkgs { system = "aarch64-darwin"; };
    #   stdenv.mkDerivation {
    #     name = "hello";
    #     src = self;
    #     buildPhase = "clang -o hello ./hello.c";
    #     installPhase = "mkdir -p $out/bin; install -t $out/bin hello";
    #   };

    defaultPackage.aarch64-darwin =
      with import nixpkgs { system = "aarch64-darwin"; };
      stdenv.mkDerivation {
        name = "hello";
        src = self;
        buildPhase = "deno compile -A ./deno-script.ts";
        installPhase = "mkdir -p $out/bin; install -t $out/bin deno-script";
      };
  };
}
