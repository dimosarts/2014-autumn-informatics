program aa; {��������� ����������� ����� ���������}
var a,b,c: integer;
D,x1,x2: real;
begin
writeln('������� �');
readln(a);
writeln('������� b');
readln(b);
writeln('������� �');
readln(c);
writeln('���� ��������� ����� ��� : ',a,'x^2+(',b,'x)+(',c,')=0');
if (a+b)>0 then
begin
D:=b*b-4*a*c;
if D<0 then
writeln('��� �� ����� ������');
if D>0 then
begin 
x1:=(-b+sqr(D))/2;
x2:=(-b-sqr(D))/2;
writeln('��� ����� ��� ����� x1=',x1,'   x2=',x2);
end;
if D=0 then
begin
x1:=(-b/2);
writeln('��� ����� ���� ������ ������ ', x1);
end;
end
else 
writeln('��������� ����� ����������� ����� ������');
end.