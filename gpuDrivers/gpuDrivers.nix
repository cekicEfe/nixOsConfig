let
	options = import ../options.nix;
	gpudriver = if options.usingNvidia then import ./nvidia/nvidia.nix
	            else if options.usingAmd then import ./amdgpu/amdgpu.nix
		    else import "";
in
{
	imports = [
		gpudriver
	];
}
