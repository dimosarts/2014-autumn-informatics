program z1;

var
  
  MainStr: string;
  i, flag: integer;

begin
  writeln('������� ������');
  writeln('***********************************');
  readln(MainStr);
  for i := length(MainStr) downto 1 do 
    if MainStr[i] = ',' then begin
      flag := i;
      break;
    end;
  if flag = 0 then writeln('������� �� �������')
  else writeln('��������� ������� ����� ', flag, ' �� �����'); 
end.