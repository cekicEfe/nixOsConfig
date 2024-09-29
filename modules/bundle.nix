let
 options = import ../options.nix;
in
{
	imports = 
	[
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
