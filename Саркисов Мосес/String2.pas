uses crt;
var s,a:string;
z:integer;
begin
readln(a);
s:=a[1];
for z:=2 to length(a) do
if not((a[z]=a[z-1]) and (a[z]='.'))
then
s:=s+a[z];
write(s);
end.