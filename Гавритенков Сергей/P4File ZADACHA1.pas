var f,g:file of integer;
    i,a:integer;
begin
assign(f,'f.txt');
reset(f);
i:=0;
assign(g,'g.txt');
rewrite(g);
while eof(f)=false do
  begin
  read(f,a);
  if (i mod 20>4) and (i mod 20<15)
  then a:=a*-1;
  write(g,a);
  inc(i);
  end;
close(f);
close(g);
end.