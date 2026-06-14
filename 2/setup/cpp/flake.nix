{
  description = "A C++ project";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

    in
    {
      # Development shell
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          gcc
          cmake
          boost
          clang
          clang-tools
          lld
          llvm
          gdb
          valgrind
          catch2
          zsh
        ];

        CC = "clang";
        CXX = "clang++";
        CMAKE_GENERATOR = "Ninja";

        shell = "${pkgs.zsh}/bin/zsh";

        shellHook = ''
          	  echo "Nix Envornment!"
          	  exec zsh
          	'';
      };
    };
}
