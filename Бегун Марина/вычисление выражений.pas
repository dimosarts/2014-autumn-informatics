var n,i:integer;
a,S:real;
begin
writeln('������� ���� n');
readln(n);
writeln('������� ���� a');
readln(a);
S:=1;
For i:=0 to n do
S:=S*(a-i*n);
Writeln('a(a-n)(a-2*n)...(a-n*n)=',S);
end.