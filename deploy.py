#!/usr/bin/env python

import tomllib
from pathlib import Path
from os import getenv, getcwd
from shutil import which
from subprocess import run


HOME = getenv("HOME")
CWD = getcwd()


def symlink(name: str, destination: str) -> None:
    ln = which("ln")
    origin = Path(CWD).joinpath(name)

    run([ln, "--symbolic", origin, destination])


with open("Manifest.toml", "rb") as manifest_file:
    manifest = tomllib.load(manifest_file)

    for entry in manifest:
        name = manifest[entry]["name"]
        location = manifest[entry]["location"]

        match location:
            case "cfg":
                destpath = Path(HOME).joinpath(f".config/{name}")
            case "home":
                destpath = Path(HOME).joinpath(name)

        print(f'Symlinking "\033[35m{name}\033[0m" to "\033[35m{destpath}\033[0m"')
        symlink(entry, destpath)
