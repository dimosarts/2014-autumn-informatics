uses crt;
var f:file of integer;
    i,a:integer;
begin
assign(f,'f.txt');
reset(f);
while eof(f)=false do
  begin
  read(f,a);
  writeln(a);
  end;
close(f);
end.