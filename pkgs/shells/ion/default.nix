{ lib, stdenv, fetchFromGitHub, rustPlatform, Security }:

rustPlatform.buildRustPackage rec {
  pname = "ion";
  version = "unstable-2020-03-22";

  src = fetchFromGitHub {
    owner = "redox-os";
    repo = "ion";
    rev = "1fbd29a6d539faa6eb0f3186a361e208d0a0bc05";
    sha256 = "0r5c87cs8jlc9kpb6bi2aypldw1lngf6gzjirf13gi7iy4q08ik7";
  };

  cargoSha256 = "12l9ga44023nnklpqrfsr9shxgrapw78biaxd0igknc7ay4j6mab";

  meta = with lib; {
    description = "Modern system shell with simple (and powerful) syntax";
    homepage = "https://gitlab.redox-os.org/redox-os/ion";
    license = licenses.mit;
    maintainers = with maintainers; [ dywedir ];
  };

  buildInputs = lib.optional stdenv.hostPlatform.isDarwin [
    Security
  ];

  passthru = {
    shellPath = "/bin/ion";
  };
}
