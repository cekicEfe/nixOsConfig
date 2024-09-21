{pkgs, ...}: 
let 
  options = import ../../options.nix;
in{
  programs.hyprland = {
    enable = true;
    nvidiaPatches = if options.systemHasNvidia then true else false;
    xwayland.enable = true;
  };
	
  environment.sessionVariables = 
  {
   WLR_NO_HARDWARE_CURSORS = "1";
   NIXOS_OZONE_WL = "1";
  };

  hardware = 
  {
    opengl.enable = true ;
    nvidia.modesetting.enable = if options.systemHasNvidia then true else false;
  };

  enviromentsystemPackages = with pkgs; [
    waybar
    eww
    dunst
    libnotify
    
    hyprpaper
    
    swaybg
    wpaperd
    mpvpaper
    swww

    kitty

    #app launcher
    rofi-wayland

  ];
  
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

}
