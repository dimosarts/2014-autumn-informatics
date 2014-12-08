program aa; {программа высчитывает корни уравнения}
var a,b,c: integer;
D,x1,x2: real;
begin
writeln('введите а');
readln(a);
writeln('введите b');
readln(b);
writeln('введите с');
readln(c);
writeln('ваше уравнение имеет вид : ',a,'x^2+(',b,'x)+(',c,')=0');
if (a+b)>0 then
begin
D:=b*b-4*a*c;
if D<0 then
writeln('оно не имеет корней');
if D>0 then
begin 
x1:=(-b+sqr(D))/2;
x2:=(-b-sqr(D))/2;
writeln('оно имеет два корня x1=',x1,'   x2=',x2);
end;
if D=0 then
begin
x1:=(-b/2);
writeln('оно имеет один корень равный ', x1);
end;
end
else 
writeln('уравнение имеет бесконечное число корней');
end.