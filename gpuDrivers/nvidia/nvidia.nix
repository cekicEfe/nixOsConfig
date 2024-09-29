{ config, lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  services.xserver.videoDrivers = ["nvidia"];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      vaapiVdpau 
      nvidia-vaapi-driver 
      intel-media-driver
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
    setLdLibraryPath = true;
  };

  hardware.nvidia = {
    open = false;
    modesetting.enable = true;
  };
}
