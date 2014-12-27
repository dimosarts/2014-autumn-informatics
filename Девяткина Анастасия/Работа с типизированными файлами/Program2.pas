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
  writeln('Введите фамилию автора');
  readln(s1);
  writeln('Введите год');
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
  if not m then writeln('Данная информация отсутствует');
  close(f1);
  reset(f1);
  writeln ('Введите слово, присутствующее в названии произведения');
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
  if not r then writeln('Произведение с данным названием отсутствует');
  close(f1);
  reset(f1);
  writeln('Если хотите добавить информацию-1, если хотите удалить информацию-2');
  readln(k);
  if k = 1 then begin
    writeln('Введите фамилию автора');
    readln(c.avtor);
    writeln('Введите название произведения');
    readln(c.name);
    writeln('Введите год');
    readln(c.god);
    seek(f1, Filesize(f1));
    write(f1, c);
    close(f1);
  end;
  if k = 2 then begin
    writeln('Введите фамилию автора');
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
  if (k <> 1) and (k <> 2) then writeln('Невозможно выполнить');
end.