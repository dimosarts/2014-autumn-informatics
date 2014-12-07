program HGfile;



var
  f, g, h: text;
  i, k, m: integer;
  s: string;

function StrtoInt(Str: string): integer;

var
  
  I, C: integer;

begin
  
  val(Str, I, C); 
  
  if C <> 0 then I := 0; 
  
  StrToInt := I; 
  
end;

begin
  
  k := 0;
  
  
  assign(f, 'D:\Github\2014-autumn-informatics\Маслов Дмитрий\FileF.txt');
  assign(g, 'D:\Github\2014-autumn-informatics\Маслов Дмитрий\FileG.txt');
  assign(h, 'D:\Github\2014-autumn-informatics\Маслов Дмитрий\FileH.txt');
  reset(f);
  rewrite(g);
  rewrite(h);
  writeln('Изначальный вид данного файла F:');
  while not eof(f) do
  begin
    readln(f, s);
    writeln(s);
    k := k + 1;
  end;
  reset(f);
  while not eof(f) do
  begin
    readln(f, s);
    m := StrToInt(s);
    if m mod 2 = 0 then
      writeln(g, s)
    else 
      writeln(h, s);
  end;
  close(f);
  close(h);
  close(g);
  
end.