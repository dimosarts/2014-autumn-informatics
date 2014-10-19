var
x1, x2, y1, y2:integer;
begin
writeln ('введите координаты начального положения ладьи');
read (x1); 
read (y1);  
writeln ('введите координаты конечного положения ладьи');
read (x2);
read (y2);
if (x1=x2) or (y1=y2)
  then writeln ('ладья может сделать такой ход')
  else writeln ('ладья не может сделать такой ход')
end.