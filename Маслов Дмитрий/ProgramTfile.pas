program Tfile;

type
  pupil = record
    Name: string[8];
    Surname: string[7];
    Form: string[3];
    FormWord: string[2];
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
        read(surname);
        write('Имя:');
        read(name);
        write('Класс:');
        read(Form);
        write('Буква класса:');
        read(FormWord);
      end;
      write(t, p);
    end;
  Writeln('Создание списка окончено');
  close(t);
end.