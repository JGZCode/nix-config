{ lib, user, hostName, ... }:
{
  home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
    rm -f ~/.gitconfig
  '';

  programs.git = {
    enable = true;

    # [l]arge [f]ile [s]torage
    # see https://docs.github.com/en/repositories/working-with-files/managing-large-files/about-git-large-file-storage
    lfs.enable = true;

    userEmail = "jgzcode@noreply.codeberg.org";
    userName = user;

    signing = {
      format = "ssh";
      signByDefault = true;
    };

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
      user.signingkey = "~/.ssh/codeberg/${hostName}";

      url = {
        "git@codeberg.org:jgzcode" = {
          insteadOf = "https://codeberg.org/jgzcode";
        };
      };
    };

    includes = [
      {
        contents = {
          user = {
            email = "80718087+JGZCode@users.noreply.github.com";
            name = "jgzcode";
            signingkey = "~/.ssh/gh/${hostName}";
          };
        };
        #condition = "gitdir:~/Development/projects/work/";
      }
    ];

    # Syntax highlighting
    delta = {
      enable = true;
      options = {
        features = "side-by-side";
      };
    };

    aliases = {
    };
  };

  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks = {
      "codeberg.org" = {
        identityFile = "~/.ssh/codeberg/${hostName}";
        identitiesOnly = true;
      };
      "github.com" = {
        identityFile = "~/.ssh/gh/${hostName}";
        identitiesOnly = true;
      };
    };
  };
}
