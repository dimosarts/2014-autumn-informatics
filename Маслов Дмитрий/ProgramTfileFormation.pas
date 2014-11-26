program TfileFormation;

type
  pupil = record
    Name: string[8];
    Surname: string[6];
    Form: string[3];
    FormWord: string[2];
  end;

var
  
  p: pupil;
  t: file of pupil;
  l: array[1..200] of pupil;
  
  n, i, j, k: byte;

begin
  writeln('');
  writeln('Вывод всей информации по ученикам:');
  writeln('n    |   Фамилия    |   Имя    |   Класс   ');
  assign(t, 'class.db');
  reset(t);
  while not eof(t) do 
  begin
    n := n + 1;
    read(t, p);
    writeln(n:4, '|', l[n].surname:4, '|', l[n].name:4, '|', l[n].form, l[n].FormWord);
  end;
  close(t);
  writeln('Вывод информации о учениках со совпадающими фамилиями:');
  for i := 1 to n do
    for j := i + 1 to n do
      if (l[i].Surname = l[j].Surname) and (l[i].Form = l[j].Form) and (l[i].FormWord = l[j].FormWord) then
      begin
        k := k + 1;
        writeln('Есть однофамильцы в одном классе');
      end;
  if (l[i].Surname = l[j].Surname) and (l[i].Form = l[j].Form) and (l[i].FormWord <> l[j].FormWord) then
  begin
    k := k + 1;
    writeln('Есть однофамильцы в параллельных классах');
  end;
  if (l[i].Surname = l[j].Surname) and (l[i].Form <> l[j].Form) and (l[i].FormWord <> l[j].FormWord) then
  begin
    k := k + 1;
    writeln('Есть однофамильцы в школе,но они в разных классах!');
  end;
  if k = 0 then writeln('В этой школе однофамильцев нет.'); 
  
  
end.