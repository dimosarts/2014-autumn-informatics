program TypedFiles22;
procedure divideOddAndEven(f1:file of integer;f2:file of integer;f3:file of integer);
var
  i:integer;
begin
while not eof(f1) do
  begin
  read(f1,i);
  if (i mod 2)<>0 then write(f2,i)
  else write(f3,i);
  end;
end;
var
  f,g,h:file of integer;
  i,j,k:integer;
begin
assign(f,'D:/fileOfInt.dat');
assign(g,'D:/fileOfIntOdd.dat');
assign(h,'D:/fileOfIntEven.dat');
reset(f);
write('���������� ��������� �����:');
while not eof(f) do
  begin
  read(f,i);
  writeln(i);
  end;
close(f);
reset(f);
rewrite(g);
rewrite(h);
divideOddAndEven(f,g,h);
close(f);
close(g);
close(h);
reset(g);
writeln('���������� ����� � ��������� �������:');
while not eof(g) do
  begin
  read(g,j);
  writeln(j);
  end;
close(g);
reset(h);
writeln('���������� ����� ������� �������:');
while not eof(h) do
  begin
  read(h,k);
  writeln(k);
  end;
close(h);
end.