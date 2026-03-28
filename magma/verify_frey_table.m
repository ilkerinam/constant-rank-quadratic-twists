///////////////////////////////////////////////////////////////////////////
// verify_frey_table.m
//
// Verifies the examples listed in Table 1.
// For each curve in the Frey table, the script:
//   1. loads the elliptic curve from its Cremona label,
//   2. checks the conductor,
//   3. checks the root number,
//   4. computes the analytic rank of each listed quadratic twist.
//
// Usage:
//   load "magma/verify_frey_table.m";
///////////////////////////////////////////////////////////////////////////

load "magma/frey_table_data.m";
load "magma/utilities.m";

PrintHeader("Verification of Table 1");

for entry in FreyTable do
    label := entry`label;
    N_expected := entry`conductor;
    w_expected := entry`root_number;
    twists := entry`twists;

    PrintHeader("Curve " cat label);

    E := EllipticCurve(label);
    N_actual := Conductor(E);
    w_actual := SafeRootNumber(E);

    print "Expected conductor:", N_expected;
    print "Computed conductor:", N_actual;

    print "Expected root number:", w_expected;
    print "Computed root number:", w_actual;

    print "Listed twist parameters d0:";
    print twists;

    for d in twists do
        Ed := QuadraticTwist(E, d);
        r := SafeAnalyticRank(Ed);

        print "d =", d, " | analytic rank =", r;
    end for;

    print "";
end for;

PrintHeader("Verification completed");
