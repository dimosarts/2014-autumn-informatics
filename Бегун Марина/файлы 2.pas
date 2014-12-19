var f, g: text;
T: array [1..10] of integer;
i,a: integer;
begin
assign(f, 'C:\Users\k01-221\Documents\K01-221\f.txt');
assign(g, 'C:\Users\k01-221\Documents\K01-221\g.txt');
reset(f);
rewrite(g);
while not eof(f) do
  begin
  for i:=1 to 10 do begin
  readln(f,a);
  writeln(g,a,' ');
  end;
  for i:=1 to 10 do begin
  readln(f,a);
  T[i]:=a;
  end;
  for i:=1 to 10 do begin
  readln(f,a);
  writeln(g,a,' ');
  end;
  for i:=1 to 10 do begin
  writeln(g,T[i],' ')
  end;
  for i:=1 to 10 do begin
  readln(f,a);
  writeln(g,a,' ');
  end;
end;
close(f);
close(g);
end.
