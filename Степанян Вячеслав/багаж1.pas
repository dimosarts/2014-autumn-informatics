TYPE
 jir = record
  fio: string[20];
  kolvo: integer;
  ves: real;
end;
VAR
 spisok: jir;
 sp: file of jir;
 n, i:integer;
begin
 writeln ('������� ���������� ����������');
 readln (n);
 assign (sp,'C:\mephi\passajir.txt');
 rewrite (sp);
 with spisok do
 for i:=1 to n do
  begin
   writeln ('������� ������� ���������');
   readln (fio);
   writeln ('������� ���������� �����');
   readln (kolvo);
   writeln ('������� ����� ��� ������');
   readln (ves);
   write (sp, spisok);
  end;
 close (sp);
end.