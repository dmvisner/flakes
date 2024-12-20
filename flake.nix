{
  description = "Parent flake for all of my dev environment packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    neovim.url = "./neovim";
  };

  outputs = { self, nixpkgs, neovim }: {
    packages = {
      x86_64-linux = {
        neovim = neovim.packages.x86_64-linux.default; 
      };
    };
  };
}
