program files;

var
  f: text;
  i, n, j: integer;
  s, s1, s2, s3: string;

begin
  assign(f, 'C:\k01-221\2014-autumn-informatics\Маслов Дмитрий\Список Учеников.txt');
  reset(f);
  while not (eof(f)) do 
  begin
    n := n + 1;
    readln(f, s);
    writeln(s);
  end;
 
  
  
  
end.