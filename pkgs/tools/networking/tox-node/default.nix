{ lib, rustPlatform, fetchFromGitHub
, libsodium, openssl
, pkg-config
}:

with rustPlatform;

buildRustPackage rec {
  pname = "tox-node";
  version = "0.1.1";

  src = fetchFromGitHub {
    owner = "tox-rs";
    repo = "tox-node";
    rev = "v${version}";
    sha256 = "sha256-tB6v2NEBdTNHf89USdQOr/pV0mbxxb8ftOYPPJMvz5Y=";
  };

  buildInputs = [ libsodium openssl ];
  nativeBuildInputs = [ pkg-config ];

  SODIUM_USE_PKG_CONFIG = "yes";

  installPhase = ''
    runHook preInstall

    install -D $releaseDir/tox-node $out/bin/tox-node

    runHook postInstall
  '';

  doCheck = false;

  cargoSha256 = "sha256-e7YUt+Ao5GNIv6xPBUj4WIcFTjMxqRLy6cSZgn6x75E=";

  meta = with lib; {
    description = "A server application to run tox node written in pure Rust";
    homepage = "https://github.com/tox-rs/tox-node";
    license = [ licenses.gpl3Plus ];
    platforms = platforms.linux;
    maintainers = with maintainers; [ suhr ];
  };
}
