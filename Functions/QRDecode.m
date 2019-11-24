function [Msg, Data] = QRDecode(Code)

    T = graythresh(Code);
    BiCode = imbinarize(Code, T);
    BiCode = imcomplement(BiCode);
    
    %Data = zeros(1, 83);

    DataBit = 0;
    
%     for Col = 1:9
%         
%         if Col <= 2
%             MinRow = 3;
%             MaxRow = 9;
%             
%         elseif Col >= 3 && Col <= 6
%             MinRow = 1;
%             MaxRow = 10;
%             
%         else
%             MinRow  = 1;
%             MaxRow = 9;
%         end
%         
%         for Row = 1:11
%             Value = BiCode(Row, Col);
%             
%             if Row >= MinRow && Row <= MaxRow
%                 DataBit = DataBit + 1;
%                 Data(DataBit) = Value;
%                 
%             end
%             
%             
%         end
%     end
    
    DataMatrix = zeros(11, 7);

    Template = [ ...
    1 0 4 5 7 8 10 11 12 0 1; ...
    0 0 4 5 7 8 10 11 12 0 0; ...
    2 3 4 5 7 9 10 11 12 0 1; ...
    2 3 4 6 7 9 10 11 12 0 1; ...
    2 3 4 6 7 9 10 11 0 0 1; ...
    2 3 4 6 7 9 10 12 0 0 1; ...
    2 3 4 6 8 9 10 12 0 0 1; ...
    2 3 5 6 8 9 11 12 0 0 1; ...
    2 3 5 6 8 9 11 12 0 0 1; ...
    0 0 5 6 8 0 0 0 0 0 0; ...
    1 0 5 7 8 0 1 1 1 1 1];
    
    BitIndex = 1;
    CharIndex = 2;
    
    for j = 1:11
        for i = 1:11
            CharBit = Template(i, j);
            
            if CharBit == CharIndex
                DataMatrix(CharIndex - 1, BitIndex) = BiCode(i, j);
                BitIndex = BitIndex + 1;
                
                if BitIndex > 7
                    CharIndex = CharIndex + 1;
                    BitIndex = 1;
                end
                
            end
            
        end
    end
    
    Data = DataMatrix;

%    Msg = '12345678900';
    
    binChar = zeros(1:7);
    
    Msg = strings([1,11]);
    
    for k = 1:11
        binVector = DataMatrix(k, :);
        
        charDEC = bin2dec(num2str(binVector));
        Character = char(charDEC);
        Msg(1, k) = Character;
    end
    
    Msg = strjoin(Msg);
    
%     for i = 0:10
%         
%         binChar = Data(1 + 7*i: 7 + 7*i);
%         binVector = (reshape(binChar,[],7));
%         Character = char(bi2de(binVector));
%         Character = binaryVectorToDecimal(binChar);
%         Msg(i + 1) = char(Character);
%     end
end

