var f, g, h: text;
a: integer;
begin
assign(f, 'C:\Users\k01-221\Documents\K01-221\f.txt');
assign(g, 'C:\Users\k01-221\Documents\K01-221\g.txt');
assign(h, 'C:\Users\k01-221\Documents\K01-221\h.txt');
reset(f);
rewrite(g);
rewrite(h);
while not eof(f) do 
  begin
  read(f,a);
  if a mod 2 = 1 then write(g,a,' ')
  else write(h,a,' ');
  end;
close(f);
close(g);
close(h);
end.