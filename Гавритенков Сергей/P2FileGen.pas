var f:file of integer;
    i,a:integer;
begin
assign(f,'f.txt');
rewrite(f);
for i:=0 to random(100) do
  begin
  if i mod 20 < 10
    then a:=random(32000)-32000
    else a:=random(32000);
  if a=0 then inc(a);
  write(f,a);
  end;
close(f);
end.