{
  description = "Parent flake for all of my dev environment packages";

  inputs = {
    neovim.url = "./neovim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { self, neovim, flake-parts } @ inputs: 
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
      ];
      perSystem = { system, ... }: let

        neovim' = neovim.packages.${system}.default;

      in {   
        packages.neovim = neovim';
      };
    };
}
