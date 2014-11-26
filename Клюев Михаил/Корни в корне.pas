program z1;
var a:real;
    n:integer;
begin
write('количество корней');
  read(n);
  a:=0;
  for n:=1 to n do 
    a:=sqrt(2+a);
  write(a:3:4);  
end.