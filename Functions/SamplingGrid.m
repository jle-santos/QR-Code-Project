function SampleMatrix = SamplingGrid(A, B, C, D, NumSample)
%   A -------------- B
%   |                
%   .
%   .
%   .
%   |
%   C -------------- D
    Factor = 1.1;
    
    SampleMatrix = zeros(NumSample, NumSample, 2);

    %Left Side
    AC = SampleInterval(A, C, NumSample);

    %Right Side
    BD = SampleInterval(B, D, NumSample);
    
    PointAC = struct;
    PointBD = struct;
    PointSample = struct;
    
    for Row = 0:NumSample - 1
       PointAC.x = round(A(1) - AC.dSampleX*Row*Factor);
       PointAC.y = round(A(2) - AC.dSampleY*Row*Factor); 
       
       PointBD.x = round(B(1) - BD.dSampleX*Row*Factor);
       PointBD.y = round(B(2) - BD.dSampleY*Row*Factor); 
       
       
       for Col = 0:NumSample - 1
            PointSample = SampleInterval([PointAC.x PointAC.y], [PointBD.x, PointBD.y], NumSample);
            X = round(PointAC.x + PointSample.dSampleX*Col*Factor);
            Y = round(PointAC.y + PointSample.dSampleY*Col*Factor); 
            
            SampleMatrix(Row + 1, Col + 1, 1) = X;
            SampleMatrix(Row + 1, Col + 1, 2) = Y;
            
       end
    end
end

