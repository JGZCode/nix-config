{ lib, ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      add_newline = true;
      command_timeout = 1000;
      palette = lib.mkForce "catppuccin_mocha";

      format = lib.concatStrings [
        "  [](overlay0)"
        "$os"
        "[](bg:blue fg:overlay0)"
        "$directory"
        "[](blue)"
        "$fill"
        "$all  "
        " $character"
        "\n"
      ];

      aws = {
        symbol = "  ";
      };

      buf = {
        symbol = " ";
      };

      c = {
        symbol = " ";
      };

      character = {
        success_symbol = "[](bold green)";
        error_symbol = "[](bold red)";
      };

      cmake = {
        symbol = " ";
      };

      cmd_duration = {
        disabled = true;
      };

      conda = {
        symbol = " ";
      };

      crystal = {
        symbol = " ";
      };

      dart = {
        symbol = " ";
      };

      directory = {
        format = "[ $path]($style)";
        read_only = " 󰌾";
        style = "bg:blue fg:base";
        truncation_length = 1;
      };

      docker_context = {
        symbol = " ";
      };

      elixir = {
        symbol = " ";
      };

      elm = {
        symbol = " ";
      };

      fennel = {
        symbol = " ";
      };

      fill = {
        disabled = false;
        style = "dimmed";
        symbol = " ";
      };

      fossil_branch = {
        symbol = " ";
      };

      git_branch = {
        format = "[$symbol$branch(:$remote_branch)]($style) ";
        symbol = " ";
      };

      git_commit = {
        tag_symbol = "  ";
      };

      golang = {
        format = "[$symbol($version )]($style)";
        symbol = " ";
      };

      gradle = {
        symbol = " ";
      };

      guix_shell = {
        symbol = " ";
      };

      haskell = {
        symbol = " ";
      };

      haxe = {
        symbol = " ";
      };

      hg_branch = {
        symbol = " ";
      };

      hostname = {
        ssh_symbol = " ";
      };

      java = {
        symbol = " ";
      };

      julia = {
        symbol = " ";
      };

      kotlin = {
        symbol = " ";
      };

      lua = {
        symbol = " ";
      };

      memory_usage = {
        symbol = "󰍛 ";
      };

      meson = {
        symbol = "󰔷 ";
      };

      nim = {
        symbol = "󰆥 ";
      };

      nix_shell = {
        format = "via [$symbol]($style) ";
        symbol = " ";
        heuristic = true;
      };

      nodejs = {
        format = "[$symbol($version )]($style)";
        symbol = " ";
      };

      ocaml = {
        symbol = " ";
      };

      os = {
        disabled = false;
        format = "[$symbol]($style)";
        style = "bg:overlay0 fg:#ffffff";
        symbols = {
          Macos = " ";
          NixOS = " ";
        };
      };

      package = {
        disabled = true;
        symbol = "󰏗 ";
      };

      perl = {
        symbol = " ";
      };

      php = {
        symbol = " ";
      };

      pijul_channel = {
        symbol = " ";
      };

      python = {
        format = "[$symbol($version )]($style)";
        symbol = " ";
      };

      rlang = {
        symbol = "󰟔 ";
      };

      ruby = {
        symbol = " ";
      };

      rust = {
        format = "[$symbol($version )]($style)";
        symbol = "󱘗 ";
        style = "bold rusty";
      };

      scala = {
        symbol = " ";
      };

      swift = {
        symbol = " ";
      };

      terraform = {
        format = "[$symbol($version )]($style)";
        symbol = "󱁢 ";
      };

      username = {
        disabled = true;
        format = "[ $user ]($style)";
        show_always = true;
        style_root = "bg:overlay0";
        style_user = "bg:overlay0 fg:#ffffff";
      };

      zig = {
        format = "[$symbol($version )]($style)";
        symbol = " ";
      };

      palettes = {
        catppuccin_mocha = {
          base = "#1e1e2e";
          blue = "#89b4fa";
          crust = "#11111b";
          flamingo = "#f2cdcd";
          green = "#32cd32";
          lavender = "#b4befe";
          mantle = "#181825";
          maroon = "#eba0ac";
          mauve = "#cba6f7";
          overlay0 = "#6c7086";
          overlay1 = "#7f849c";
          overlay2 = "#9399b2";
          peach = "#fab387";
          pink = "#f5c2e7";
          red = "#f38ba8";
          rosewater = "#f5e0dc";
          rusty = "#bb5741";
          sapphire = "#74c7ec";
          sky = "#89dceb";
          subtext0 = "#a6adc8";
          subtext1 = "#bac2de";
          surface0 = "#313244";
          surface1 = "#45475a";
          surface2 = "#585b70";
          teal = "#94e2d5";
          text = "#cdd6f4";
          yellow = "#f9e2af";
        };
      };
    };
  };
}
