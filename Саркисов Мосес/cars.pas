program cars;
type car=record
  brand: string[20];
  lisense: string[10];
  surname: string[15];
  release_date: integer;
  end;
var
  f: file of car;
  s: string[20];
  c: char;
procedure add(f: file of car);
  var p:  car;
  begin
  if not fileexists('cars.#') then
    begin
    rewrite(f);
    close(f);
    end;
  reset(f);
  seek(f,filesize(f));
  writeln('������� �����');
  readln(p.brand);
  writeln('������� �����');
  readln(p.lisense);
  writeln('������� ������� ���������');
  readln(p.surname);
  writeln('������� ���� ������� (� ������� ��������)');
  readln(p.release_date);
  write(f,p);
  close(f);
  writeln('���������� ������ � ����!');
  end;
procedure delete(f: file of car);
  var p,q,c:  car;
      size_in_begin:  integer;
  begin
  reset(f);  
  if filesize(f)=0 then
    begin
    writeln('���� �����!');
    exit;
    end;
  size_in_begin:=filesize(f);
  seek(f,filesize(f)-1);
  read(f,q);
  seek(f,0);
  writeln('������� �����');
  readln(p.brand);
  writeln('������� �����');
  readln(p.lisense);
  writeln('������� ������� ���������');
  readln(p.surname);
  writeln('������� ���� ������� (� ������� ��������)');
  readln(p.release_date);
  while not eof(f) do
    begin
    read(f,c);
    if (c.brand=p.brand)and(c.lisense=p.lisense)and(c.surname=p.surname)and(c.release_date=p.release_date) then
      begin
      seek(f,filepos(f)-1);
      write(f,q);
      seek(f,filesize(f)-1);
      truncate(f);
      break;
      end;
    end;
  if filesize(f)<>size_in_begin then writeln('���������� ��� ������ �� ����!') else writeln('���������� �� ��� ������.');
  close(f);
  end;
procedure later(f: file of car);
  var d:  integer;
      p:  car;
  begin
  reset(f);
  if filesize(f)=0 then
    begin
    writeln('���� �����!');
    exit;
    end;
  writeln('������� ����');
  readln(d);
  writeln;
  writeln('   ____________________________________________________________________________');
  writeln('   ','|        �����        ','|  ������� ���������  ','|    �����    ','|  ���� �������  |');
  while not eof(f) do
    begin
    read(f,p);
    if p.release_date<=d then writeln('   |',p.brand:20,' |',p.surname:20,' |',p.lisense:12,' |',p.release_date:15,' |');
    end;
  writeln('   |_____________________|_____________________|_____________|________________|');
  end;
procedure clean(f: file of car);
  var switch:  char;
  begin
  reset(f);
  if filesize(f)=0 then
    begin
    writeln('���� �����!');
    exit;
    end;
  close(f);
  readln();
  repeat
    begin
      writeln('�� �������? (y/n)');
      readln(switch);
    end;
  until (lowercase(switch)='y')or(lowercase(switch)='n');
  if lowercase(switch)='y' then
    begin
    rewrite(f);
    close(f);
    writeln('���� �������!');
    end;
  end;
procedure show(f: file of car);
  var p:  car;
  begin
  reset(f);
  if filesize(f)=0 then
    begin
    writeln('���� �����!');
    exit;
    end;
  writeln;
  writeln('   ____________________________________________________________________________');
  writeln('   ','|        �����        ','|  ������� ���������  ','|    �����    ','|  ���� �������  |');
  while not eof(f) do
    begin
    read(f,p);
    writeln('   |',p.brand:20,' |',p.surname:20,' |',p.lisense:12,' |',p.release_date:15,' |');
    end;
  writeln('   |_____________________|_____________________|_____________|________________|');
  close(f);
  end;
begin
  assign(f,'cars.#');
  writeln('�������� ��������');
  writeln('1 - �������� ����������;');
  writeln('2 - ������� ����������;');
  writeln('3 - ������� �����, ������� ���������� � ������, �����������, ���������� �� ������� �������� ����;');
  writeln('4 - �������� ����;');
  writeln('5 - ���������� ��� ����;');
  writeln('����� ������ ������ - �����.');
  read(c);
  case c of
    '1': begin
         readln(s);
         add(f);
         end;
    '2': begin
         readln(s);
         delete(f);
         end;
    '3': later(f);
    '4': clean(f);
    '5': show(f);
    else exit;
    end;
end.