var
  f, g, h: file of integer;
  a: integer;

begin
  assign(f, 'input.txt');
  assign(g, 'outputn.txt');
  assign(h, 'outputc.txt');
  reset(f);
  rewrite(g);
  rewrite(h);
  while not eof(f) do 
  begin
    read(f, a);
    if a mod 2 = 1 then write(g, a,' ') else write(h, a,' ');
  end;
  close(f);
  close(g);
  close(h);
end.