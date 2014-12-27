program n2_3;
var S,a:  string;
    x:    integer;
begin
read(s);
a:=s;
while pos(',',a)<>0 do
  begin
  x:=pos(',',a);
  delete(a,x,1);
  insert('0',a,0);
  end;
writeln(s);
writeln(a);
write(x);
end.