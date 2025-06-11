{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    prefix = "C-s";
    mouse = true;
    shell = "${pkgs.zsh}/bin/zsh";

    extraConfig = ''
      # Status bar customisation
      set -g status-style "fg=terminal bg=terminal"
      set -g status-left "#[fg=terminal,bg=terminal]"
      set -g status-right "#[fg=terminal,bg=terminal]#W:#I #[fg=terminal,bg=terminal]"

      # Keybindings
      # Vim keys to cycle between windows & panes
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Open new panes and windows in the current working directory
      bind "%" split-window -h -c "#{pane_current_path}"
      bind '"' split-window -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
    '';
  };
}
