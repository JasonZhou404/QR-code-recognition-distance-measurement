function [ msg ] = Char_Get_Fn( Num_get,Char_Size,Mode )

switch Mode
    case 'Numeric'
        % Find two-digit decimals and one digit indexes
%         if mod(Num_get,3)~=0
%          Two_Dig_Nums=find(9<Num_get(1,1:end-1) & Num_get(1,1:end-1)<100) ;      % Last digit should be excluded is length mod(Num_get,3)~=0
%          One_Dig_Nums=find(9<Num_get(1,1:end-1) & Num_get(1,1:end-1)<100);
%          Not_Three_digit=[Two_Dig_Nums One_Dig_Nums];
%         else
%          Two_Dig_Nums=find(9<Num_get & Num_get<100);       % We do not excluded last digit because mod(Num_get,3)==0
%          One_Dig_Nums=find(9<Num_get & Num_get<100);
%          Not_Three_digit=[Two_Dig_Nums One_Dig_Nums];
%         end
        msg=[];
        FF=length(Num_get)-mod(length(Num_get),3);           
        for i=1:FF                 
%          if ~isempty(find(Not_Three_digit==i))
           msg1=num2str(Num_get(1,i), '%03d' );     % pad zero before any not three digit_num decimal
           msg=[msg msg1];
        end
        for i=FF+1:length(Num_get)               
%          if ~isempty(find(Not_Three_digit==i))
           msg1=num2str(Num_get(1,i));     % pad zero before any not three digit_num decimal
           msg=[msg msg1];
        end
    
    
    case 'Byte'
        msg=char(Num_get);
    
    case 'Alphanumeric'
        Seq=[];
        if mod(Char_Size,2)==0
            for i=1:length(Num_get)
                a=mod(Num_get(1,i),45);
                A=(Num_get(1,i)-mod(Num_get(1,i),45))/45;
                Seq = [Seq get_AlphaNum_Fn(A) get_AlphaNum_Fn(a)];
            end
        else
            for i=1:length(Num_get)-1
                a=mod(Num_get(1,i),45);
                A=(Num_get(1,i)-mod(Num_get(1,i),45))/45;
                Seq = [Seq get_AlphaNum_Fn(A) get_AlphaNum_Fn(a)];
            end
                a=mod(Num_get(1,length(Num_get)),45);
                %A=(Num_get(1,length(Num_get))-mod(Num_get(1,length(Num_get)),45))/45;
                Seq = [Seq get_AlphaNum_Fn(a)];
        end
        msg=Seq;
end
                



end

