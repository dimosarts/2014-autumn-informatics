program z1;

var
  
  MainStr: string;
  i, flag: integer;

begin
  writeln('Введите строку');
  writeln('***********************************');
  readln(MainStr);
  for i := length(MainStr) downto 1 do 
    if MainStr[i] = ',' then begin
      flag := i;
      break;
    end;
  if flag = 0 then writeln('Запятых не найдено')
  else writeln('Последняя запятая стоит ', flag, ' по счету'); 
end.