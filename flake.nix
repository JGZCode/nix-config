{
  description = "NixOS & Nix-darwin configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    #If you are using a stable release of NixOS, ensure that you use the matching Stylix release.
    stylix = {
      url ="github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ... }@inputs:
  let
    user      = "jgz";
    mkSystem = import ./lib/mksystem.nix {
      inherit nixpkgs user inputs;
    };
  in {
    nixosConfigurations.nixos-desktop = mkSystem {
      system    = "x86_64-linux";
      hostName  = "jgz-nixos";
    };

    darwinConfigurations.macbook-x86 = mkSystem {
      system    = "x86_64-darwin";
      hostName  = "Felix-MBP-2020";
      darwin    = true;
    };

    darwinConfigurations.macbook-aarch64 = mkSystem {
      system    = "aarch64-darwin";
      hostName  = "Felix-MBA-M2";
      darwin    = true;
    };
  };
}
