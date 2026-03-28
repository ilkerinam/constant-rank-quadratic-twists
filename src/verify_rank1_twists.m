///////////////////////////////////////////////////////////////////////////
// verify_rank1_twists.m
//
// Verify the cleaned rank-1 representatives appearing in the paper
///////////////////////////////////////////////////////////////////////////


// ======================= LOAD FILES =======================

load "../data/frey_table_clean.m";
load "utils.m";


// ======================= MAIN =======================

PrintHeader("Verification of cleaned rank-1 representatives");

for entry in FreyTable do

    label := entry`label;
    twists := entry`twists;

    E := EllipticCurve(label);
    N := Conductor(E);

    PrintHeader("Curve " cat label cat " (conductor " cat IntegerToString(N) cat ")");

    if #twists eq 0 then
        print "No representatives recorded for this curve.";
        print "";
        continue;
    end if;

    for d in twists do

        if not IsSquarefreeInteger(d) then
            print "d =", d, " | WARNING: not squarefree";
        else
            Ed := QuadraticTwist(E, d);
            r := SafeAnalyticRank(Ed);
            w := SafeRootNumber(Ed);

            print "d =", d, " | squarefree = true | analytic rank =", r, " | root number =", w;
        end if;

    end for;

    print "";
end for;

PrintHeader("Verification completed");
