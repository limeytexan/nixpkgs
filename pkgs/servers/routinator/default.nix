{ lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "routinator";
  version = "0.8.3";

  src = fetchFromGitHub {
    owner = "NLnetLabs";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-JwPAwhD+Pkx8Kx24m7z/RbEvDnI2YR8dnTgAV7TMsFE=";
  };

  cargoSha256 = "sha256-GUwKilH6OD6lyqywld/Lm57uipxoSqxeXzRNWF/hoVs=";

  meta = with lib; {
    description = "An RPKI Validator written in Rust";
    homepage = "https://github.com/NLnetLabs/routinator";
    license = licenses.bsd3;
    maintainers = with maintainers; [ _0x4A6F ];
    platforms = platforms.linux;
  };
}
