BEGIN { print "<testsuite name=\"org.jainslee.tck\" time=\"1.0\">" }

{
    gsub(/\//, ".", $1);
    #find last dot pos 
    lastDot = match($1, /[^.]+$/);
    #remove .xml
    className = substr($1,1,lastDot - 2);
    #get last dot pos again
    lastDot = match(className, /[^.]+$/);
    #finally get test name
    className = substr(className,lastDot);

    printf "<testcase classname=\"";
    print $1;
    printf"\" name=\"";
    printf className;
    print "\" time=\"0.0\">";
    if ($2 !="Passed.") {
       printf "<failure message=\"";
       for(i=3;i<=NF;i++){printf "%s ", $i};
       print "\"/>";
    }
    print "</testcase>";
}

END { # this assumes all non-blank lines will have an item
    print "</testsuite>";
}

