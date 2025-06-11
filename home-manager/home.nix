{ config, lib, pkgs, darwin, ... }:
{
  imports = [
    ./packages.nix

    ./modules/direnv.nix
    ./modules/eza.nix
    ./modules/fzf.nix
    ./modules/git.nix
    ./modules/neovim.nix
    ./modules/services.nix
    ./modules/starship.nix
    ./modules/symlinks.nix
    ./modules/tmux.nix
    ./modules/yazi.nix
    ./modules/zsh.nix
    ./modules/vscode.nix    

  ] ++ (lib.optionals (darwin) [   # only on darwin systems

  ]) ++ (lib.optionals (!darwin) [   # only on nixos systems
    ./modules/nixos
  ]);
  
  home = {
    stateVersion = "25.05";
  };

  xdg = {
    enable = true;
    configFile = {
      "nvim/init.lua".enable = false;
    };
  };
}
