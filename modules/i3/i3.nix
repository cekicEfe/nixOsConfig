{
  imports = [../xserver/xserver.nix];
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.i3.enable = true;
}
