function [code, data] = GenerateCode(string)
%Create empty string
if length(string) > 11
    error('Max number of characters is 11');
end

data = zeros(1, 83);

NumChar = length(string);

BitIndex = 1;

for CharIndex = 1:NumChar
    NumDEC = double(string(CharIndex));
    
    NumBIN = dec2bin(NumDEC);
    
    for Bit = 1:length(NumBIN)
        
        data(BitIndex) = str2num((NumBIN(Bit)));
        
        BitIndex = BitIndex + 1;
    end
end

code = [ ...
    1 0 2 2 2 2 2 2 2 0 1; ...
    0 0 2 2 2 2 2 2 2 0 0; ...
    2 2 2 2 2 2 2 2 2 0 1; ...
    2 2 2 2 2 2 2 2 2 0 1; ...
    2 2 2 2 2 2 2 2 2 0 1; ...
    2 2 2 2 2 2 2 2 2 0 1; ...
    2 2 2 2 2 2 2 2 2 0 1; ...
    2 2 2 2 2 2 2 2 2 0 1; ...
    2 2 2 2 2 2 2 2 2 0 1; ...
    0 0 2 2 2 0 0 0 0 0 0; ...
    1 0 2 2 2 0 1 1 1 1 1];

code(find(code==2)) = data;
figure; imagesc(~code); colormap gray; axis equal; axis off;
end

