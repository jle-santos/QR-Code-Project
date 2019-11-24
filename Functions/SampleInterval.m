function SamplingVector = SampleInterval(A, C, NumSample)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    SamplingVector = zeros(2,11);
    Factor = 1.10;
    
    AC = struct;
    AC.diff = norm(A - C);
    AC.dY = C(2) - A(2);
    AC.dX = C(1) - A(1);
    AC.dPhi = atand(AC.dY/AC.dX);
    AC.dStep = AC.diff/NumSample;
    
    if AC.dY < 0
        AC.dSampleY = (-1)*abs(AC.dStep*sind(AC.dPhi));
    else
        AC.dSampleY = abs(AC.dStep*sind(AC.dPhi));
    end
    
    if AC.dX < 0
        AC.dSampleX = (-1)*abs(AC.dStep*cosd(AC.dPhi));
    else
        AC.dSampleX = abs(AC.dStep*cosd(AC.dPhi));
    end
    
    %Create sampling vectors
    %StartPoint
    
    for Sample = 0:NumSample-1
        PointAC.x = round(A(1) + AC.dSampleX*Sample*Factor);
        PointAC.y = round(A(2) + AC.dSampleY*Sample*Factor);
        
        SamplingVector(1,Sample+1) = PointAC.x;
        SamplingVector(2,Sample+1) = PointAC.y;
    end
end

