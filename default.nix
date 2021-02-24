let
    ihp = builtins.fetchGit {
        url = "https://github.com/digitallyinduced/ihp.git";
        rev = "d9128a9179dcfed3682f7c377c6811f0b0f64268";
    };
    haskellEnv = import "${ihp}/NixSupport/default.nix" {
        ihp = ihp;
        haskellDeps = p: with p; [
            cabal-install
            base
            wai
            text
            hlint
            p.ihp
        ];
        otherDeps = p: with p; [
        ];
        projectPath = ./.;
    };
in
    haskellEnv
