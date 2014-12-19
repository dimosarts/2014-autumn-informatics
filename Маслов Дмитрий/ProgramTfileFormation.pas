program TfileFormation;

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
  l: array[1..200] of pupil;
  
  n, i, j, k: byte;

begin
  writeln('');
  writeln('Вывод всей информации об учениках::');
  writeln('n    |   Фамилия    |   Имя    |   Класс   ');
  assign(t, 'class.db');
  reset(t);
  while not eof(t) do 
  begin
    n := n + 1;
    read(t, l[n]);
    writeln(n:4, '|':2, l[n].surname:10, '|':5, l[n].name:9, '|':2, l[n].form:5, l[n].FormWord:2);
  end;
  close(t);
  writeln('Вывод информации об учениках с совпадающими именами и фамилиями:');
  for i := 1 to n do
    for j := i + 1 to n do
    begin
      if ((l[i].Surname = l[j].Surname) and (l[i].Form = l[j].Form) and (l[i].FormWord = l[j].FormWord))
      then
      begin
        k := k + 1;
        writeln('Есть Однофамильцы в одном классе');
      end;
      if ((l[i].Surname = l[j].Surname) and (l[i].Form = l[j].Form) and (l[i].FormWord <> l[j].FormWord))
      then
      begin
        k := k + 1;
        writeln('Есть Однофамильцы в параллельных классах');
      end;
      if ((l[i].Surname = l[j].Surname) and (l[i].Form <> l[j].Form))
      then
      begin
        k := k + 1;
        writeln('Есть Однофамильцы в школе,но они в разных в классах!');
      end;
    end;
  if k = 0 then writeln('В школе нет однофамильцев.'); 
end.