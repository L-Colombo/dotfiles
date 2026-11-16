{
  lib,
  python3Packages,
  fetchFromGitHub,
  nix-update-script,
}:

python3Packages.buildPythonApplication (finalAttrs: {
  pname = "toc";
  version = "0.1.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "L-Colombo";
    repo = "toc";
    tag = finalAttrs.version;
    hash = "sha256-lNhi6zfIGPukAh0TbpT2p/9xG1W3Lh0ZLpSC+Vve3Bc=";
  };

  build-system = [
    python3Packages.setuptools
  ];

  dependencies = with python3Packages; [
    chardet
    click
    pymupdf
    toml
  ];

  pythonImportsCheck = [
    "toc"
  ];

  pythonRelaxDeps = true;

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "";
    homepage = "https://github.com/L-Colombo/toc";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "toc";
  };
})
