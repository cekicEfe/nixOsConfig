{ pkgs , ... }:{
	nixpkgs.config = 
	{
		permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
		allowUnfree = true;
	};
	
	environment.systemPackages = with pkgs; 
	[
		neofetch
		libreoffice-qt6-still
		libsForQt5.okular	
		wget	
		xorg.xkill
		alacritty
		ranger
		feh
		blender

		gnumake
		arch-install-scripts
		unzip
		zip
		nodejs
		python
		gcc
		cmake
		git

		pipewire
		pulseaudio

		xclip
	];
	fonts.packages = with pkgs; [
	    jetbrains-mono
	    noto-fonts
	    noto-fonts-emoji
	    twemoji-color-font
	    font-awesome
	    powerline-fonts
	    powerline-symbols
	    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  	];
}

