var x,y:real;
begin

x:=1;
y:=0;

writeln('y=sin1.0+sin1.1+sin1.2+...+sin2.0');

while x<=2 do
   begin
   y:=y+sin(x);
   x:=x+0.1;
   end;

write('y=',y:1:3);
end.  