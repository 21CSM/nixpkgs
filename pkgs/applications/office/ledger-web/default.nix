{
  lib,
  bundlerApp,
  bundlerUpdateScript,
  withPostgresql ? true,
  libpq,
  withSqlite ? false,
  sqlite,
}:

bundlerApp {
  pname = "ledger_web";
  gemdir = ./.;
  exes = [ "ledger_web" ];

  buildInputs = lib.optional withPostgresql libpq ++ lib.optional withSqlite sqlite;

  passthru.updateScript = bundlerUpdateScript "ledger-web";

  meta = with lib; {
    description = "Web frontend to the Ledger CLI tool";
    homepage = "https://github.com/peterkeen/ledger-web";
    license = licenses.mit;
    maintainers = with maintainers; [
      peterhoeg
      manveru
      nicknovitski
    ];
    platforms = platforms.linux;
    mainProgram = "ledger_web";
  };
}
