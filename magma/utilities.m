///////////////////////////////////////////////////////////////////////////
// utilities.m
//
// Auxiliary routines for printing and formatting output.
///////////////////////////////////////////////////////////////////////////

procedure PrintLine(str)
    print str;
end procedure;

procedure PrintSeparator()
    print "------------------------------------------------------------";
end procedure;

procedure PrintHeader(str)
    PrintSeparator();
    print str;
    PrintSeparator();
end procedure;

function SafeRootNumber(E)
    try
        return RootNumber(E);
    catch e
        return "unavailable";
    end try;
end function;

function SafeAnalyticRank(E)
    try
        return AnalyticRank(E);
    catch e
        return "unavailable";
    end try;
end function;
