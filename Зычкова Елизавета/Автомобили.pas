uses crt;
const n=3;

Type rec=record
    brand:string[15];
    number:string[6];
    fname:string[15];
    year:integer
    end;
var cars: file of rec;
    a:rec;
    i,y,t:integer;
    k,s1:string;
    m:boolean;
begin
clrscr;
assign(cars,'cars.txt');

writeln('���� ������ ������ ����� ������ �����������, ������� 1');
writeln('���� ������ �������� ����� ���������� � ������, ������� 2');
writeln('���� ������ ������� ����������, ������� 3');
writeln('���� ������ ������ ������ �����������, ���������� �� ������������ ����, ������� 4');
readln(t);

if t=1 then begin
rewrite(cars);
for i:=1 to n do
    begin
    writeln('������� ����� ����������:');
    readln(a.brand);
    writeln('������� ����� ����������:');
    readln(a.number);
    writeln('������� ������� ���������:');
    readln(a.fname);
    writeln('������� ��� �������:');
    readln(a.year);
    write(cars,a);
    writeln;
    end;
close(cars);
end;

if t=4 then begin
writeln;
reset(cars);
  writeln('������� ������ ��� �������:');
  readln(y);
  while not eof(cars) do
      begin
      read (cars,a);
      if a.year<=y then
         begin
         writeln(a.number,', ',a.fname);
         m:=true;
         end;
      end;

  if m then writeln('(����������, ���������� �� ������� ������� ����)')
  else writeln('��� �����������, ���������� �� ������� ������� ����');
  close(cars);
end;

if t=2 then begin  
  writeln;
  reset(cars);
  writeln('������ �������� ���������� � ����� ����������? ��/���');
  readln(k);
  if k='��' then
      begin
      writeln('������� ����� ����������:');
      readln(a.brand);
      writeln('������� ����� ����������:');
      readln(a.number);
      writeln('������� ������� ���������:');
      readln(a.fname);
      writeln('������� ��� �������:');
      readln(a.year);
      seek(cars, Filesize(cars));
      write(cars, a);
      end;
      close(cars);
end;

if t=3 then begin
  writeln;
  reset(cars);
  writeln('������ ������� ���������� �� ����������? ��/���');
  readln(k);
  if k ='��' then
      begin
      writeln('������� ����� ����������, ������� ������ �������:');
      readln(s1);
      while not eof(cars) do
          begin
          read(cars,a);
          if (s1 = a.number) then
             begin
             i := filepos(cars) - 1;
             seek(cars, filesize(cars) - 1);
             read(cars,a);
             seek(cars,i);
             write(cars,a);
             seek(cars,filesize(cars)- 1);
             truncate(cars);
             end;
         end;
     close(cars);
  end;
end;

end.