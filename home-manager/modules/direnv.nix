{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
    silent = true;
    config = {
      load_dotenv = true;
    };
    stdlib = "
      source_up .envrc
      source_up .env
    ";
  };
}
