{
  description = "derek's neovim flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim"; 
  };

  outputs = { self, nixpkgs, nixvim } @ inputs: let

    module = {
      module = import ./config;
    }; 

    forAllSystems = function:
      nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
      ] (system: function nixvim.legacyPackages.${system});

  in {
    packages = forAllSystems (nixvim': {
      default = nixvim'.makeNixvimWithModule module;
    });
    
    
  };
}
