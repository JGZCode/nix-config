# Nix Configuration Flake

This repository contains a Nix flake used to manage both NixOS and Nix-darwin machines.

## Hosts

The flake defines the following system configurations:

- **nixos-desktop** – `x86_64-linux` NixOS host with the machine name `jgz-nixos`.
- **macbook-x86** – `x86_64-darwin` macOS host named `Felix-MBP-2020`.
- **macbook-aarch64** – `aarch64-darwin` macOS host named `Felix-MBA-M2`.

These targets are defined in [`flake.nix`](./flake.nix).

## Building / Switching

To build or activate a host configuration, run one of the following commands from the repository root:

```bash
# For the NixOS system
sudo nixos-rebuild switch --flake .#nixos-desktop

# For macOS systems
sudo darwin-rebuild switch --flake .#macbook-x86      # Intel Mac
sudo darwin-rebuild switch --flake .#macbook-aarch64  # Apple Silicon Mac
```

Home‑Manager is integrated, so switching also applies the user configuration.
