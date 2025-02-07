{
    description = "A very basic flake";
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
    outputs = { self, nixpkgs }: 
    {
        nixosConfigurations = {
            t480 = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./hosts/t480/configuration.nix
                ];
            };
        };
    };
}
