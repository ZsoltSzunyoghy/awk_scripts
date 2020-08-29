#!/usr/bin/awk -f

# This script corrects the GPS X coordinates in the original faulty .gpx file.
#   Starting from a specific value there was an error of -0.009441 shift in the X value
#   This shift corrects all X values starting from that specific value

# run with this command:
#  awk -v CONVFMT=%.6f -f shiftGPScoordiantes.awk Amazfit20200825214234.gpx >a2.gpx

BEGIN{
        toPrint = 0;
}

#this is the specific value where the shift starts
/47\.38765/ {
        #print "//////////////////Apply change from here";
        toPrint = 1;
}

(toPrint == 1) && match($0, /(47\.[^\"]*)\"/, a){
        #print a[1];
        #print a[1] + 0.009441;
        gsub(a[1],a[1]+0.009441);
        #print;
}

#!(toPrint == 1) || !match($0, /(47\.[^\"]*)\"/, a){
{
        print;
}