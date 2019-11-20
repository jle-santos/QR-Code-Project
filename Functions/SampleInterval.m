function AC = SamplingInterval(A, C, NumSamples)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    AC = struct;
    AC.diff = norm(A - C);
    AC.dY = A(2) - C(2);
    AC.dX = A(1) - C(1);
    AC.dPhi = atand(AC.dY/AC.dX);
    AC.dStep = AC.diff/NumSamples;
    AC.dSampleY = AC.dStep*sind(AC.dPhi);
    AC.dSampleX = AC.dStep*cosd(AC.dPhi);
    
end

