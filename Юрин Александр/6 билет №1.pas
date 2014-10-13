var x,y,u:real;
begin
 writeln('введите х ');
 read(x);
 writeln('введите у ');
 read(y);
 if (x*x+y*y<0.25 ) and (x>0) and (y>0) or (y<0) then
  u:=y*y+2*x*y
 else
  u:=x*x+2*x*y;
 writeln('результат ', u);
end.
