var
  f, g: text; 
  i: integer; 
  st, st1: string;

begin
  assign(f, 'input.txt'); 
  assign(g, 'output.txt');
  reset(f); 
  rewrite(g);
  while not eof(f) do 
    while not eoln(f) do 
    begin
      begin
        read(f, st);  
        st1 := ''; 
        for i := 1 to length(st) do st1 := st[i] + st1; 
        write(g, st1);
      end; 
      readln(f);
      writeln(g);
    end;
  close(f);
  close(g);
end.