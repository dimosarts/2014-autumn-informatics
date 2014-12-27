program Tfile;

type
  pupil = record
    Name: string[20];
    Surname: string[20];
    Form: string[3];
    FormWord: string[3];
  end;

var
  
  p: pupil;
  t: file of pupil;
  i, n: integer;



begin
  assign(t, 'class.db');
  rewrite(t);
  Writeln('Введите количество учеников');
  readln(n);
  for i := 1 to n do 
    with p do 
    begin
      begin
        write(i, '-ая фамилия:');
        readln(surname);
        write('Имя:');
        readln(name);
        write('Класс:');
        readln(Form);
        write('Буква класса:');
        readln(FormWord);
      end;
      write(t, p);
    end;
  Writeln('Оформление файла закончено');
  close(t);
end.