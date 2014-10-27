var x,y,U:real;
begin

write('x=');read(x);
write('y=');read(y);

if (x*x+y*y>=1) and (x>=-1) and (x<=1) and (y>=-1) and (y<=1) then
    begin
    writeln('òî÷êà ïğèíàäëåæèò îáëàñòè');
    U:=sqrt(abs(x*x-1));
    end
    
else 
    begin
    writeln('òî÷êà íå ïğèíàäëåæèò îáëàñòè');
    U:=x+y;
    end;

writeln('Ğåçóëüòàò âû÷èñëåíèÿ ôóíêöèè: U=',U:1:2);
end.
    