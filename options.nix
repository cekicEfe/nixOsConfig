{
  #Bootloader location
  bootLoaderLocation = "/dev/sda";
  usingUefi = false;

  #Select proper graphics driver : nvidia will be propitery !!!
  systemHasNvidia = true;
  systemHasAmd = false;

  #is important with nvidia allows the usage of OPTIMUS PRIME 
  #which is responsible foe gpu efficency go check it out;
  systemIsLaptop = false;

  #You can obviuslregyuwerh use only one of these
  #Trying to use more than one will boot into tty (uses none of them)
  usingHyprland = false;
  usingGnome = true;
  usingi3 = false;
}
