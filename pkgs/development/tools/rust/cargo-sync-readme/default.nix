{ lib, rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "cargo-sync-readme";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "phaazon";
    repo = pname;
    rev = version;
    sha256 = "1c38q87fyfmj6nlwdpavb1xxpi26ncywkgqcwbvblad15c6ydcyc";
  };

  cargoSha256 = "086b780mckscwnxcryz790gvah0pmf84m1sp50fpnxhfg6ga37jj";

  meta = with lib; {
    description = "A cargo plugin that generates a Markdown section in your README based on your Rust documentation";
    homepage = "https://github.com/phaazon/cargo-sync-readme";
    license = licenses.bsd3;
    maintainers = with maintainers; [ b4dm4n ];
  };
}
