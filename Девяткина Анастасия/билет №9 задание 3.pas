var x,y,u:real;
begin
writeln ('¬ведите значени€ x и y');
read(x, y);
if (y<=x*x+1) and (y>=x*x+sqr(y-1)) and (x<0) 
then begin
u:= sqrt((abs(x)+sqrt(sqr(x)+sqr(y)))/2);
writeln ('u=', u:4:2);
end
else 
begin
u:= sqrt((abs(y)+sqrt(sqr(x)+sqr(y)))/2);
writeln ('u=', u:4:2);
end;
end.