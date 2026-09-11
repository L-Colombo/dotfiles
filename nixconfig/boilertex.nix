{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
  installShellFiles,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "boilertex";
  version = "0.1.0";
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "L-Colombo";
    repo = "boilertex";
    tag = "v${finalAttrs.version}";
    hash = "sha256-NcOla1r7tY4sw3CtZfzUumLU18NQbRbA0soiYkl6OoA=";
  };

  nativeBuildInputs = [ installShellFiles ];

  postInstall = ''
    installManPage ./etc/man/boilertex.1
    installManPage ./etc/man/boilertex-generate.1
    installManPage ./etc/man/boilertex-list.1
    installManPage ./etc/man/boilertex-preview.1

    installShellCompletion etc/shell_comp/{_boilertex,boilertex.bash}
  '';

  cargoHash = "sha256-sgMT73gbG+G5yklrjUopmpZTJNXboXi241Z3p73wQnk=";

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "";
    homepage = "https://github.com/L-Colombo/boilertex";
    license = lib.licenses.mit;
    mainProgram = "boilertex";
  };
})
