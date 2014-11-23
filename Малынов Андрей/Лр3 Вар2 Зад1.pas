program slon;
var  n,k: integer;
s,s1 : string;  {s1-исходная строка s-помогает рассмотреть строку посимвольно}
begin
  writeln('Введите строку');
  readln(s);
  writeln('до преобразования ',s);
  n := Length(s);
  writeln ('длина ',n);
  s1:='';
  for var i:=1 to n do begin
  if s[i]<>'*' then 
  s1:=s1+s[i]+s[i];
  end;
  if (s1='') then writeln('Полученная строка не содержит элементов')
  else begin
  writeln ('после преобразования ',s1);
  k:=Length(s1);
  writeln ('Длина ',k);
  end;
  end.
  
  
 