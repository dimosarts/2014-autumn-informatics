var y,s, x,xn:real;
i,n: integer;
begin
writeln ('������� �������� x');
read(x);
s:=0; n:=10;i:=11;
if (x<0) 
then begin
for i:=11 downto 1 do
xn:=i*(-exp(n*ln(abs(x))));
s:=s+xn;
n:=n-1;
writeln (s:4:2);
end;
if (x>0) then begin
for i:=11 downto 1 do
xn:=i*(exp(n*ln(x)));
s:=s+xn;
n:=n-1;
writeln (s:4:2);
end;
end.