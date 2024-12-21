{
  description = "derek's neovim flake";

  inputs = {
    nixvim.url = "github:nix-community/nixvim"; 
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { self, nixpkgs, nixvim, flake-parts } @ inputs: 
    flake-parts.lib.mkFlake { inherit inputs; } {

    systems = [
      "x86_64-linux"
    ];
    
    perSystem = { system, ... }: let

      module = {
        module = import ./config;
      };

      nixvim' = nixvim.legacyPackages.${system};
    in {
      packages.default = nixvim'.makeNixvimWithModule module;
    };
  };
}
