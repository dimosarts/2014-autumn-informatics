program Tfile;


var
  f, g: text;
  i,  j, k: integer;
  s, s1, s2,s3: string;

begin
  j := 0;
  k := 0;
  s1 := ' ';
  assign(f, 'C:\k01-221\2014-autumn-informatics\Маслов Дмитрий\FileF.txt');
  assign(g, 'C:\k01-221\2014-autumn-informatics\Маслов Дмитрий\FileG.txt');
  reset(f);
  reset(g);
  writeln('Исходный файл выглядит таким образом:');
  while not eof(f) do
  begin
    readln(f, s);
    writeln(s);
  end;
  s2 := s;
  close(f);
  k := length(s);
  for i:=1 to k do
  begin
  repeat
  j:=j+1 until
  s[i]= s1;
  s3:=Copy(s,i,j);
  writeln(s3);
  end;
  
  
  
  
  
  
  
end.