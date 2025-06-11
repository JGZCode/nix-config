{ config, pkgs, lib, inputs, darwin, ... }:
let
  conf = "${config.xdg.configHome}";
  dot = "${config.home.homeDirectory}/.dotfiles";
  symlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.file = lib.mkMerge [
  {
    "${conf}/nvim" = {
      source = symlink "${dot}/nvim";
    };
  }
  # obsidian
  {
    "${conf}/obsidian/obsidian.json" = {
      source = symlink "${dot}/obsidian/obsidian.json";
    };
  }
  {
    "${conf}/obsidian/plugins" = {
      source = symlink "${dot}/obsidian/plugins";
    };
  }
  # aerospace
    (lib.mkIf darwin {
      "${conf}/aerospace" = {
        source = symlink "${dot}/aerospace";
      };
    })
  ];
}
