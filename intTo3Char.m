function thetaString = intTo3Char(theta)
    thetaString = "";
    if(theta < 10)
       thetaString = "00";
    elseif(theta < 100)
        thetaString = "0";
    end
thetaString = [thetaString, int2str(theta)];
