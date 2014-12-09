uses crt;
var n,i:byte;
    a,b:real;
begin
readln(n,a);
b:=a;
if n>1 then
  for i:=1 to n-1 do
    b:=b*(a+i);
write(b);
end.