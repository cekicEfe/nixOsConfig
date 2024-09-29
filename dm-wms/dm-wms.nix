let
	options = import ../options.nix;
	displayer = if options.usingi3 
	     then import ./i3/i3.nix
	     else if options.usingGnome 
	     then import ./gnome/gnome.nix
	     else import [];

in
{
	imports = [ 
		displayer 
	];
}
