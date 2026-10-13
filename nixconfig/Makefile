.PHONY: rebuild upgrade

all: copy

copy:
	sudo cp ./configuration.nix /etc/nixos/configuration.nix
	sudo cp ./boilertex.nix /etc/nixos/boilertex.nix
	sudo cp ./tgr.nix /etc/nixos/tgr.nix
	sudo cp ./toc.nix /etc/nixos/toc.nix

rebuild: copy
	sudo nixos-rebuild switch

upgrade: copy
	sudo nixos-rebuild switch --upgrade

