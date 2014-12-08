program text;
procedure yrsearch(f:textfile;year:integer);
  var
    s,s1,s2:string;
    n1,l,k,i:integer;
    found:boolean;
  begin
  writeln('Список автомобилей, удовлетворяющих условию:');
  while not eof(f) do
    begin
    readln(f, s);
      l:=length(s);
      i:=1;
      while s[i]<>' ' do
        begin
        i:=i+1;
        end;
      s1:=copy(s, l-4, l);
      s2:=copy(s, i+1, l-(5+i));
      val(s1,n1,k);
      if n1>=year then
        begin
        writeln(s2);
        found:=true;
        end;
    end;
    if not found then write('Не найдено таких автомобилей.');
 end;
procedure cardel(f:textfile;s:string);
  var
    temp:textfile;
    str,s1:string;
    found:boolean;
    j,l:integer;
  begin
  assign(temp, 'C:\Users\k01-221\temp.txt');
  rewrite(temp);
  found:=false;
  while not eof(f) do
    begin
    readln(f,str);
    l:=length(str);
    j:=1;
    while str[j]<>' ' do
      begin
      j:=j+1;
      end;
    s1:=copy(str,j+1,6);
    if s1=s then found:=true
    else writeln(temp,str);
    end;
  if found=false then writeln('Не найдено таких автомобилей.');
  close(f);
  close(temp);
  rewrite(f);
  reset(temp);
  while not eof(temp) do
    begin
    readln(temp,str);
    writeln(f,str);
    end;
  close(temp);
  erase(temp);
  end;
function exitcall(p:integer):boolean;
  begin
  writeln('Операция завершена. Выйти из программы?');
  writeln('1 - Да, выйти');
  writeln('2 - Нет, вернуться в меню');
  readln(p);
    repeat
    if p=1 then exitcall:=true
    else if p=2 then exitcall:=false
    else writeln('Действие не выбрано');
    until (p=1) or (p=2);
  end;
var
  f:textfile;
  purpose,year,p:integer;
  s,stand:string;
  ext:boolean;
begin
assign(f, 'C:\Users\k01-221\carlist.txt');
repeat
writeln('Что нужно сделать с файлом?');
writeln('1 - Найти автомобили, выпущенные не позднее определенного года');
writeln('2 - Добавить автомобиль');
writeln('3 - Удалить автомобиль');
writeln('4 - Выход из программы');
readln(purpose);
stand:='МАРКА НОМЕР ФАМИЛИЯ_ВЛАДЕЛЬЦА ГОД_ВЫПУСКА';
if purpose=1 then
  begin
  reset(f);
  writeln('Введите дату, не позднее которой должен быть выпущен автомобиль: ');
  readln(year);
  yrsearch(f,year);
  ext:=exitcall(p);
  close(f);
  end
else if purpose=2 then
  begin
  writeln('Введите новый автомобиль в формате:',stand);
  readln(s);
  append(f);
  writeln(f, s);
  ext:=exitcall(p);
  close(f);
  end
else if purpose=3 then
  begin
  reset(f);
  writeln('Введите автомобиль, который нужно удалить, в формате:',stand);
  readln(s);
  cardel(f, s);
  ext:=exitcall(p);
  close(f);
  end
else if purpose=4 then
  begin
  exit;
  end
else writeln('Действие не выбрано.');
until ext=true;
end.