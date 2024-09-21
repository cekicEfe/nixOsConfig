let
  options = import ../options.nix;
in
{
  boot.loader = 
    if !options.usingUefi then {
      grub.enable = true;
      grub.device = options.bootLoaderLocation;
      grub.useOSProber = true;
    } else {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
}
