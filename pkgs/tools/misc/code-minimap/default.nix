{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage rec {
  pname = "code-minimap";
  version = "0.5.0";

  src = fetchFromGitHub {
    owner = "wfxr";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-t+zHAneINLd8JHkhaR+aF55gAWJmphYEqbx74CqAmM8=";
  };

  cargoSha256 = "sha256-Ix8V1GOtk96yLbik8gst0XrtHGzYlT5kmqJPefFhO/M=";

  meta = with lib; {
    description = "A high performance code minimap render";
    homepage = "https://github.com/wfxr/code-minimap";
    license = with licenses; [ asl20 /* or */ mit ];
    maintainers = with maintainers; [ bsima ];
  };
}
