const n = 20 ;
var a,i:integer;
input:file of integer;
output:file of integer;
ch:array[1..n]of integer;
  begin
  assign(input,'C:\Users\k01-221\репозиторий\f.txt');
  reset(input);
  for i := 1 to n do
    begin
    readln(a);
    ch[i]:= a;
    end;
  close(input);
  assign(output,'C:\Users\k01-221\репозиторий\g.txt');
  rewrite(output);
  for i :=1 to 5 do 
    begin
    a:= ch[i];
    writeln(a);
    end;
  for i:=11 to 15 do
    begin
    a:=ch[i];
    writeln(a);
    end;
  for i:= 6 to 10 do
    begin
    a:=ch[i];
    writeln(a);
    end;
  for i:= 16 to 20 do
    begin
    a:=ch[i];
    writeln(a);
    end;
  close(output);
  end.
  
