let
 options = import ../options.nix;
 
 hardwareConfig = if options.systemHasNvidia && !options.systemHasAmd
                  then import ./nvidia/nvidia.nix
		  else if options.systemHasAmd && !options.systemHasNvidia
		  then import ./amdgpu/amdgpu.nix
		  else import [];
 
 displayConfig = if options.usingHyprland && !options.usingGnome && !options.usingithree
 		 then import ./hyprland/hyprland.nix
		 else if !options.usingHyprland && options.usingGnome && !options.usingithree
		 then import ./gnome/gnome.nix
		 else if !options.usingHyprland && !options.usingGnome && options.usingithree
 		 then import ./i3/i3.nix 
		 else import [];
in
{
	imports = 
	[
		hardwareConfig
		displayConfig

		#programs
		./importprograms/importprograms.nix
		./audio/audio.nix
		./bluetooth/bluetooth.nix
		./virtmanager/virtmanager.nix
		./nwmanager/nwmanager.nix
		./trim/trim.nix

		#to run external binaries
		#use nix-alien ./your/bash/thingmabob.sh\bin to use
		./nix-alien/nix-alien.nix

		###firewall and ssh
		./firewall/firewall.nix
	];
}
