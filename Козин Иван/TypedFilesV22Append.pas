program AppendTypedFilesV22;
var
  f:file of integer;
  i:integer;
  choice:string;
begin
assign(f,'D:/fileOfInt.dat');
rewrite(f);
writeln('��������� ����� ����� � ����:');
repeat
  begin
  readln(i);
  write(f,i);
  writeln('����� �� ���������?(y,n)');
  readln(choice);
  end;
until choice='y';
close(f);
end.