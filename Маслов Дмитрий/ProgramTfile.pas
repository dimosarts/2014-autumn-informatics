program Tfile;


var
  f, g: text;
  i,  j, k, m: integer;
  s, s5, s2, s3, s4: string;

begin
  j := 0;
  k := 0;
  
  s4 := '-';
  assign(f, 'C:\k01-221\2014-autumn-informatics\������ �������\FileF.txt');
  assign(g, 'C:\k01-221\2014-autumn-informatics\������ �������\FileG.txt');
  reset(f);
  rewrite(g);
  writeln('�������� ���� �������� ����� �������:');
  while not eof(f) do
  begin
    readln(f, s);
    writeln(s);
    k := k + 1;
  end;
  reset(f);
 
end.