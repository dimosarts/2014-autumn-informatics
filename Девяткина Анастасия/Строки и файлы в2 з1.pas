var
  i, n,j: integer;
   s0,s1 : string;

begin
  writeln('Введите строку');
  readln(s0);
  n := Length(s0);
  writeln ('Длина исходной строки равна ',n);
  s1:=' ';
  for i:=1 to n do begin
  if s0[i]<>'*' then 
  s1:=s1+s0[i]+s0[i];
  end;
  if (s1=' ') then writeln('Полученная строка не содержит элементов')
  else begin
  writeln ('Полученная строка имеет вид', s1);
   j:=length (s1)-1;
  writeln ('Длина полученной строки ', j);
  end;
  end.
  
  
 