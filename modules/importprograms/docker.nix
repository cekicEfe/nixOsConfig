{
  virtualisation.docker.enable = true;
  users.users.nixy.extraGroups = [ "docker" ];
  
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
}
