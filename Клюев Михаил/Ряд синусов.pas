program z1;
var a,sum,x:real;
    n:integer;
begin
  write('степень последнего элемента и аргумент');
  read(n,x);
  a:=1;
  for n:=1 to n do begin
    a:=a*sin(x);
    sum:=sum+a;
  end;
  write(sum:1:2);  
end.