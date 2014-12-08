program textfile;
var     f,g:  text;
        a:    array [0..19] of string;
        i:    integer;
begin
  assign (f,'input.txt');
  assign (g,'output.txt');
  rewrite(f);
  for i:=0 to 99 do if (i mod 10)<5 then writeln(f,random*100+0.1) else writeln(f,random*(-100)-0.1);
  close(f);
  reset(f);
  rewrite(g);
  while not eof(f) do
    begin
    for i:=0 to 4 do readln(f,a[i]);
    for i:=10 to 14 do readln(f,a[i]);
    for i:=5 to 9 do readln(f,a[i]);
    for i:=15 to 19 do readln(f,a[i]);
    for i:=0 to 19 do writeln(g,a[i]);
    end;
  close(g);
end.