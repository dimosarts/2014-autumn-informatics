var x,y:real;
begin

x:=1;
y:=0;

while x<=2 do
   begin
   y:=y+sin(x);
   x:=x+0.1;
   end;

write('y=',y:1:3);
end.  