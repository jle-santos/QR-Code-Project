function [Msg, data] = QRDecode(Code)
    
    Code = (~Code);
    
    %Each row corresponds to 1 byte (ASCII)
    data = zeros(1,83);
    
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

    data = Code(find(code==2));

    segment = reshape(data(1:80), 8, []);
    Msg = strings([1,10]);

    for i = 1:10
        Msg(i) = char(bin2dec(num2str(segment(:,i)')));
    end

    Msg = strjoin(Msg);
    
%     %Decoder template
%     Template = [ ...
%     1 0 4 5 7 8 10 11 12 0 1; ...
%     0 0 4 5 7 8 10 11 12 0 0; ...
%     2 3 4 5 7 9 10 11 12 0 1; ...
%     2 3 4 6 7 9 10 11 12 0 1; ...
%     2 3 4 6 7 9 10 11 0 0 1; ...
%     2 3 4 6 7 9 10 12 0 0 1; ...
%     2 3 4 6 8 9 10 12 0 0 1; ...
%     2 3 5 6 8 9 11 12 0 0 1; ...
%     2 3 5 6 8 9 11 12 0 0 1; ...
%     0 0 5 6 8 0 0 0 0 0 0; ...
%     1 0 5 7 8 0 1 1 1 1 1];
%     
%     BitIndex = 1;
%     CharIndex = 2;
%     
%     %Iterate through code
%     for j = 1:11
%         for i = 1:11
%             CharBit = Template(i, j);
%             
%             if CharBit == CharIndex
%                 DataMatrix(CharIndex - 1, BitIndex) = Code(i, j);
%                 BitIndex = BitIndex + 1;
%                 
%                 %Byte exceeded, loop back
%                 if BitIndex > 7
%                     CharIndex = CharIndex + 1;
%                     BitIndex = 1;
%                 end
%                 
%             end
%             
%         end
%     end
%     
%     %Return byte array
%     Data = DataMatrix;
%     
%     %String message
%     Msg = strings([1,11]);
%     
%     %Convert bytes to characters
%     for k = 1:11
%         binVector = DataMatrix(k, :); 
%         charDEC = bin2dec(num2str(binVector));
%         Character = char(charDEC);
%         Msg(1, k) = Character;
%     end
%     
%     %Concatenate all characters together
%     Msg = strjoin(Msg);
end

