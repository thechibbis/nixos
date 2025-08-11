{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      background-opacity = 0.8;
      theme = "rose-pine";
      font-size = "13";
      font-family = "JetBrains Mono";
      font-style = "Medium";

      window-padding-x = 0;
      window-padding-y = 0;
      window-padding-balance = false;
    };
  };
}
