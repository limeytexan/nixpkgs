{ lib
, fetchurl
, rustPlatform
, pkg-config
, wrapGAppsHook
, openssl
, gtk3
, gdk-pixbuf
, pango
, atk
, cairo
}:

rustPlatform.buildRustPackage rec {
  pname = "castor";
  version = "0.8.16";

  src = fetchurl {
    url = "https://git.sr.ht/~julienxx/castor/archive/${version}.tar.gz";
    sha256 = "1qwsprwazkzcs70h219fhh5jj5s5hm1k120fn3pk4qivii4lyhah";
  };

  cargoSha256 = "1nbriclm54qgyvlcv2ldcp2w0m04jmx5n7fb4zayaxmbhq2ndc8x";

  nativeBuildInputs = [
    pkg-config
    wrapGAppsHook
  ];

  buildInputs = [
    openssl
    gtk3
    gdk-pixbuf
    pango
    atk
    cairo
  ];

  postInstall = "make PREFIX=$out copy-data";

  # Sometimes tests fail when run in parallel
  cargoParallelTestThreads = false;

  meta = with lib; {
    description = "A graphical client for plain-text protocols written in Rust with GTK. It currently supports the Gemini, Gopher and Finger protocols";
    homepage = "https://sr.ht/~julienxx/Castor";
    license = licenses.mit;
    maintainers = with maintainers; [ fgaz ];
  };
}
