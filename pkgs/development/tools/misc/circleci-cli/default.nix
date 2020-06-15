{ stdenv, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  pname = "circleci-cli";
  version = "0.1.7971";

  src = fetchFromGitHub {
    owner = "CircleCI-Public";
    repo = pname;
    rev = "v${version}";
    sha256 = "0nrmdql3h9jnfgmp8898c9v07f5h5r9dvabaqhk98r6a77g3rr98";
  };

  vendorSha256 = "0y35ps2pw9z7gi4z50byd1py87bf2jdvj7l7w2gxpppmhi83myc9";

  buildFlagsArray = [ "-ldflags=-s -w -X github.com/CircleCI-Public/circleci-cli/version.Version=${version}" ];

  preBuild = ''
    substituteInPlace data/data.go \
      --replace 'packr.New("circleci-cli-box", "../_data")' 'packr.New("circleci-cli-box", "${placeholder "out"}/share/circleci-cli")'
  '';

  postInstall = ''
    install -Dm644 -t $out/share/circleci-cli _data/data.yml
  '';

  meta = with stdenv.lib; {
    # Box blurb edited from the AUR package circleci-cli
    description = ''
      Command to enable you to reproduce the CircleCI environment locally and
      run jobs as if they were running on the hosted CirleCI application.
    '';
    maintainers = with maintainers; [ synthetica ];
    license = licenses.mit;
    homepage = "https://circleci.com/";
  };
}