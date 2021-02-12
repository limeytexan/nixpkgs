{ lib, fetchFromGitHub, rustPlatform, libseccomp }:

rustPlatform.buildRustPackage rec {
  pname = "railcar";
  version = "1.0.4";

  src = fetchFromGitHub {
    owner = "oracle";
    repo = "railcar";
    rev = "v${version}";
    sha256 = "09zn160qxd7760ii6rs5nhr00qmaz49x1plclscznxh9hinyjyh9";
  };

  # Submitted upstream https://github.com/oracle/railcar/pull/44
  cargoPatches = [ ./cargo-lock.patch ];
  cargoSha256 = "1yvii4d4bmx7bzms4i0zsffsv0ygg0cmy6c594qpyajs8c9cimpl";

  buildInputs = [ libseccomp ];

  meta = with lib; {
    description = "Rust implementation of the Open Containers Initiative oci-runtime";
    homepage = "https://github.com/oracle/railcar";
    license = with licenses; [ asl20 /* or */ upl ];
    maintainers = [ maintainers.spacekookie ];
  };
}
