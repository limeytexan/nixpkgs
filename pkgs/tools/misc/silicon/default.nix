{ lib
, stdenv
, rustPlatform
, fetchFromGitHub
, pkg-config
, cmake
, llvmPackages
, expat
, freetype
, libxcb
, python3
, AppKit
, CoreText
, Security
}:

rustPlatform.buildRustPackage rec {
  pname = "silicon";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "Aloxaf";
    repo = "silicon";
    rev = "v${version}";
    sha256 = "0cvzkfyljgxhmn456f2rn0vq2bhm1ishr4jg4dnwjjfgmjg3w908";
  };

  cargoSha256 = "0qb188kzmwcb1wc3m5dv5352a9a1vs6dzpj5qvb0q092j53203qz";

  buildInputs = [ llvmPackages.libclang expat freetype ]
    ++ lib.optionals stdenv.isLinux [ libxcb ]
    ++ lib.optionals stdenv.isDarwin [ AppKit CoreText Security ];

  nativeBuildInputs = [ cmake pkg-config ]
    ++ lib.optionals stdenv.isLinux [ python3 ];

  LIBCLANG_PATH = "${llvmPackages.libclang}/lib";

  meta = with lib; {
    description = "Create beautiful image of your source code";
    homepage = "https://github.com/Aloxaf/silicon";
    license = with licenses; [ mit /* or */ asl20 ];
    maintainers = with maintainers; [ evanjs ];
  };
}
