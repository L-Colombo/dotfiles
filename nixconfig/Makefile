.PHONY: rebuild upgrade

all: copy

copy:
	sudo cp --recursive ./custompkgs /etc/nixos
	sudo cp ./configuration.nix /etc/nixos/configuration.nix

rebuild: copy
	sudo nixos-rebuild switch

upgrade: copy
	sudo nixos-rebuild switch --upgrade

