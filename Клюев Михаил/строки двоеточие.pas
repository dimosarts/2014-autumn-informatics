program z1;

var

  MainStr        :string;
  i, flag1, flag2:integer;
  
begin

  writeln('Введите строку для обработки');
  readln(MainStr);
  for i := 1 to length(MainStr) do
    if MainStr[i] = ':' then if flag1 <> 0 then flag2 := i
      else flag1 := i;
  if flag2 = 0 then writeln(copy(MainStr, flag1 + 1, length(MainStr))) else
    writeln(copy(MainStr, flag1 + 1, flag2 - flag1 - 1));
    
end.