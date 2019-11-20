function Msg = QRDecode(Code)

    T = graythresh(Code);
    BiCode = imbinarize(Code, T);
    BiCode = imcomplement(BiCode);
    
    Data = zeros(1, 83);

    DataBit = 0;
    
    for Col = 1:9
        
        if Col <= 2
            MinRow = 3;
            MaxRow = 9;
            
        elseif Col >= 3 && Col <= 6
            MinRow = 1;
            MaxRow = 10;
            
        else
            MinRow  = 1;
            MaxRow = 9;
        end
        
        for Row = 1:11
            Value = BiCode(Row, Col);
            
            if Row >= MinRow && Row <= MaxRow
                DataBit = DataBit + 1;
                Data(DataBit) = Value;
                
            end
            
            
        end
    end
    
    Msg = '12345678900';
    
    binChar = zeros(1:7);
    
    for i = 0:10
        
        binChar = Data(1 + 7*i: 7 + 7*i);
        %binVector = (reshape(binChar,[],7));
        %Character = char(bi2de(binVector));
        Character = binaryVectorToDecimal(binChar);
        Msg(i + 1) = char(Character);
    end
end

