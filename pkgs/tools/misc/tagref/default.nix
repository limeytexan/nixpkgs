{ lib, fetchFromGitHub, rustPlatform }:
rustPlatform.buildRustPackage rec {
  pname = "tagref";
  version = "1.4.1";

  src = fetchFromGitHub {
    owner = "stepchowfun";
    repo = pname;
    rev = "v${version}";
    sha256 = "0y1c0v2zjpav1n72pgf3kpqdz6ixp2mjhcvvza4gzfp865c236nc";
  };

  cargoSha256 = "11hlrq26rs499kq85m6awa1958rrd3fbrr6n0fnhkpdh6qnzpv6w";

  meta = with lib; {
    description = "Tagref helps you refer to other locations in your codebase.";
    homepage = "https://github.com/stepchowfun/tagref";
    license = licenses.mit;
    maintainers = [ maintainers.yusdacra ];
    platforms = platforms.unix;
  };
}
