{
	imports = [../xserver/xserver.nix];

	services.xserver.displayManager.gdm.enable = true;
	services.xserver.desktopManager.gnome.enable = true;
}
