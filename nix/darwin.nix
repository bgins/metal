{ self, darwin, home-manager, ... }:
let
  mkDarwin = hostName: modules:
    let
      hostSystem = self.hosts.${hostName}.system;
    in
    darwin.lib.darwinSystem {
      system = hostSystem;
      modules = [
        home-manager.darwinModules.home-manager
        (_: {
          networking.hostName = hostName;
        })
      ] ++ modules;
      specialArgs = { inherit home-manager; };
    };
in
{
  argent = mkDarwin "argent" [ ./hosts/argent/darwin-configuration.nix ];
  aurum = mkDarwin "aurum" [ ./hosts/aurum/darwin-configuration.nix ];
}
