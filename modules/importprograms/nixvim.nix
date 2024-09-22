{config,pkgs,...}:
let
    nixvim = import (builtins.fetchGit {
        url = "https://github.com/nix-community/nixvim";
        # When using a different channel you can use `ref = "nixos-<version>"` to set it here
    });
in{
	imports = [ nixvim.nixosModules.nixvim ];

	programs.nixvim = {
		enable = true;
		defaultEditor = true;

		plugins = {

		transparent = {
			enable = true;
		};
		treesitter = {
		    enable = true;
			
		    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
		      bash
		      cpp
		      json
		      lua
		      make
		      markdown
		      nix
		      regex
		      toml
		      vim
		      vimdoc
		      xml
		      yaml
		    ];
		  };

		};
	};
}
