{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      mgr = {
        show_hidden = false;
        sort_dir_first = true;
      };
      preview = {
        max_width = 1200;
        max_height = 1800;
      };
      open = {
        prepend_rules = [
          { name = "*.csv"; use = [ "open" "edit" "reveal" ]; }
        ];
      };
    };
  };
}
