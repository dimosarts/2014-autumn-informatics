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
  writeln('Введите марку');
  readln(p.brand);
  writeln('Введите номер');
  readln(p.lisense);
  writeln('Введите фамилию владельца');
  readln(p.surname);
  writeln('Введите дату выпуска (в формате ГГГГММДД');
  readln(p.release_date);
  write(f,p);
  close(f);
  end;
procedure delete(f: file of car);
  var p,q,c:  car;
  begin
  reset(f);  
  seek(f,filesize(f)-1);
  read(f,q);
  seek(f,0);
  writeln('Введите марку');
  readln(p.brand);
  writeln('Введите номер');
  readln(p.lisense);
  writeln('Введите фамилию владельца');
  readln(p.surname);
  writeln('Введите дату выпуска (в формате ГГГГММДД)');
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
  close(f);
  end;
procedure later(f: file of car);
  var d:  integer;
      p:  car;
  begin
  reset(f);
  writeln('Введите дату');
  readln(d);
  writeln; writeln('        Марка        ','  Фамилия владельца  ','    Номер    ','  Дата выпуска  ');
  while not eof(f) do
    begin
    read(f,p);
    if p.release_date<=d then writeln(p.brand:21,p.surname:20,p.lisense:13,p.release_date:16);
    end;
  end;
begin
  assign(f,'cars.#');
  writeln('Выберите действие');
  writeln('1 - Добавить автомобиль;');
  writeln('2 - Удалить автомобиль;');
  writeln('3 - Вывести марки, фамилии владельцев и номера, автомобилей, выпущенных не позднее заданной даты;');
  writeln('Любой другой символ - выход.');
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
    else exit;
    end;
end.