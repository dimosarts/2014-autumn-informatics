uses crt;
var i:byte;
    j:real;
begin
j:=0;
for i:=10 to 20 do
    begin
    j:=j+sin(i/10);
    end;
writeln(j);
end.