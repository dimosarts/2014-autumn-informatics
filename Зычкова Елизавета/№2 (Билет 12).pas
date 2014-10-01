var x,y: real;
begin

write('x='); read(x);
write('y='); read(y);

if (x<0) and (y<0) then 
   begin
   x:=abs(x);
   y:=abs(y);
   end;

if (x<0) xor (y<0) then
   begin
   x:=x+0.5;
   y:=y+0.5;
   end;

if (x>=0) and (y>=0) then
   begin
   x:=x/10;
   y:=y/10;
   end;
   
writeln('Результат обработки: x=',x,', y=',y);
end.