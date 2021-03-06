{ lib
, nixosTests
, fetchFromGitHub
, rustPlatform
, installShellFiles
}:

rustPlatform.buildRustPackage rec {
  pname = "lsd";
  version = "0.19.0";

  src = fetchFromGitHub {
    owner = "Peltoche";
    repo = pname;
    rev = version;
    sha256 = "1iiczdsqw0i6cz492177z6lr8s7fikn151j8p76fmr77zk0bm6q2";
  };

  cargoSha256 = "0c29igbi6hf7c6zwkz8hc57xhd86wi7zyj0waam01jv8vkvwm5fp";

  nativeBuildInputs = [ installShellFiles ];
  postInstall = ''
    installShellCompletion $releaseDir/build/lsd-*/out/{_lsd,lsd.{bash,fish}}
  '';

  # Found argument '--test-threads' which wasn't expected, or isn't valid in this context
  doCheck = false;

  passthru.tests = { inherit (nixosTests) lsd; };

  meta = with lib; {
    homepage = "https://github.com/Peltoche/lsd";
    description = "The next gen ls command";
    license = licenses.asl20;
    maintainers = with maintainers; [ Br1ght0ne marsam zowoq ];
  };
}
