{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  users.users.nixy.isNormalUser = true;
  home-manager.users.nixy = {
    home = {
	username = "nixy";
	homeDirectory = "/home/nixy";
	packages = with pkgs; [
		tor-browser
		btop
	];
	shellAliases = {
		opdevtime = "nix-shell -p glfw imgui assimp";
	};
    };

    programs.bash = {
	enable = true;
    };

    home.stateVersion = "24.05";
  };
}
