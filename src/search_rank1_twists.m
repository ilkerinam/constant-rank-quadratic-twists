///////////////////////////////////////////////////////////////////////////
// search_rank1_twists.m
//
// Search for rank-1 quadratic twists in residue classes d = d0 + 4N*k
///////////////////////////////////////////////////////////////////////////


// ======================= LOAD DATA =======================

load "../data/frey_table_clean.m";


// ======================= UTILITIES =======================

function IsSquarefreeInteger(n)
    if n eq 0 then
        return false;
    end if;

    fac := Factorization(Abs(n));
    for t in fac do
        if t[2] ge 2 then
            return false;
        end if;
    end for;

    return true;
end function;

function SafeAnalyticRank(E)
    try
        return AnalyticRank(E);
    catch e
        return -1;
    end try;
end function;


// ======================= PARAMETERS =======================

SEARCH_BOUND := 40;


// ======================= MAIN LOOP =======================

print "------------------------------------------------------------";
print "Search for rank-1 quadratic twists";
print "------------------------------------------------------------";

for entry in FreyTable do

    label := entry`label;
    twists := entry`twists;

    E := EllipticCurve(label);
    N := Conductor(E);
    M := 4*N;

    print "------------------------------------------------------------";
    print "Curve", label, " (modulus 4N =", M, ")";
    print "------------------------------------------------------------";

    for d0 in twists do

        print "Starting d0 =", d0;

        found := [];

        for k in [0..SEARCH_BOUND] do

            d := d0 + M*k;

            if d ne 0 and IsSquarefreeInteger(d) then

                Ed := QuadraticTwist(E, d);
                r := SafeAnalyticRank(Ed);

                if r eq 1 then
                    Append(~found, d);
                end if;

            end if;

        end for;

        print "Rank-1 twists found:";
        print found;
        print "";

    end for;

end for;

print "------------------------------------------------------------";
print "Search completed";
print "------------------------------------------------------------";
