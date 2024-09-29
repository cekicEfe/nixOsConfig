{ config, pkgs, ... }:{
  services.xserver = {
  enable = true;
    xkb.layout = "tr";
    xkb.variant = "";

    desktopManager = {
      xterm.enable=false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };
    displayManager = {
      defaultSession = "xfce+i3";
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
	i3lock
	i3blocks
      ];
      configFile = /etc/nixos/dm-wms/i3/config;
    };
  };

  console.keyMap = "trq";
  services.xserver.windowManager.i3.package = pkgs.i3-gaps;
  programs.dconf.enable = true;

  services.picom = {
    enable = true;
    fade = true;
    #vSync = true;
    shadow = true;
    fadeDelta = 4 ;
    inactiveOpacity = 0.8;
    activeOpacity = 1;
    #backend = "glx";
    settings = {
      blur = {
	#method = "dual_kawase";
	background = true;
	strength = 5;
      };
    };
  };
}
