{ lib
, fetchFromGitHub
, rustPlatform
}:

rustPlatform.buildRustPackage rec {
  pname = "each";
  version = "0.1.3";

  src = fetchFromGitHub {
    owner = "arraypad";
    repo = pname;
    rev = "v${version}";
    sha256 = "04rx8jf871l4darfx6029dhpnbpmzwjgzazayp1qcaadsk8207z5";
  };

  cargoSha256 = "108bwldn30jw66vaalrw3013psr9bknm87xpsbfsshs748wjrspr";

  meta = with lib; {
    description = " A better way of working with structured data on the command line";
    homepage = "https://github.com/arraypad/each";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ thiagokokada ];
  };
}
