type
  rec = record
    avtor: string[20];
    name: string[50];
    god: string[10];
  end;

var
  f1: file of rec;
  b, c: rec;
  s1, s2, s3, s4: string;
  m, r: boolean;
  p, i, k: integer;

begin
  assign(f1,'f.txt');
  reset(f1);
  writeln('������� ������� ������');
  readln(s1);
  writeln('������� ���');
  readln(s2);
  while not eof(f1) do begin
  read (f1,b);
  if (b.avtor=s1)  and (b.god>=s2) then Begin
  writeln(b.avtor);
  writeln(b.name);
  writeln(b.god);
  m:=true;
  end;
  end;
  if not m then writeln('������ ���������� �����������');
  close(f1);
  reset(f1);
  writeln ('������� �����, �������������� � �������� ������������');
  read(s3);
  while not eof(f1) do begin
  read (f1,b);
  p:=Pos(s3,b.name);
  if p<>0 then Begin
  writeln(b.avtor);
  writeln(b.name);
  writeln(b.god);
  r:=true;
  end;
  end;
  if not r then writeln('������������ � ������ ��������� �����������');
  close(f1);
  reset(f1);
  writeln('���� ������ �������� ����������-1, ���� ������ ������� ����������-2');
  readln(k);
  if k = 1 then begin
    writeln('������� ������� ������');
    readln(c.avtor);
    writeln('������� �������� ������������');
    readln(c.name);
    writeln('������� ���');
    readln(c.god);
    seek(f1, Filesize(f1));
    write(f1, c);
    close(f1);
  end;
  if k = 2 then begin
    writeln('������� ������� ������');
    readln(s4);
    while not eof(f1) do 
    begin
      read(f1, b);
      if (s4 = b.avtor) then begin
        i := filepos(f1) - 1;
        seek(f1, filesize(f1) - 1);
        read(f1, b);
        seek(f1, i);
        write(f1, b);
        seek(f1,filesize(f1)- 1);
        truncate(f1);
      end;
    end;
    close(f1);
  end;
  if (k <> 1) and (k <> 2) then writeln('���������� ���������');
end.