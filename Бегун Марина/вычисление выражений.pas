var n,i:integer;
a,S:real;
begin
writeln('введите чило n');
readln(n);
writeln('введите чило a');
readln(a);
S:=1;
For i:=0 to n do
S:=S*(a-i*n);
Writeln('a(a-n)(a-2*n)...(a-n*n)=',S);
end.