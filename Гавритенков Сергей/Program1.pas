var f:file of integer;
a,i,iread:integer;
begin
randomize();
readln(iread);
assign(f,'f.txt');
rewrite(f);
for i:=0 to iread-1 do
begin
if i mod 20 < 10 then
a:=random(32768)
else
a:=random(32768)-32768;
write(f,a);
end;
close(f);
end.