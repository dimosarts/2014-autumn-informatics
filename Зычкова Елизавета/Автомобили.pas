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

writeln('Если хотите ввести новый список автомобилей, нажмите 1');
writeln('Если хотите добавить новый автомобиль в список, нажмите 2');
writeln('Если хотите удалить автомобиль, нажмите 3');
writeln('Если хотите узнать номера автомобилей, выпущенных до определенной даты, нажмите 4');
readln(t);

if t=1 then begin
rewrite(cars);
for i:=1 to n do
    begin
    writeln('Введите марку автомобиля:');
    readln(a.brand);
    writeln('Введите номер автомобиля:');
    readln(a.number);
    writeln('Введите фамилию владельца:');
    readln(a.fname);
    writeln('Введите год выпуска:');
    readln(a.year);
    write(cars,a);
    writeln;
    end;
close(cars);
end;

if t=4 then begin
writeln;
reset(cars);
  writeln('Введите нужный год выпуска:');
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

  if m then writeln('(автомобили, выпущенные не позднее нужного года)')
  else writeln('Нет автомобилей, выпущенных не позднее нужного года');
  close(cars);
end;

if t=2 then begin  
  writeln;
  reset(cars);
  writeln('Хотите добавить информацию о новом автомобиле? Да/Нет');
  readln(k);
  if k='Да' then
      begin
      writeln('Введите марку автомобиля:');
      readln(a.brand);
      writeln('Введите номер автомобиля:');
      readln(a.number);
      writeln('Введите фамилию владельца:');
      readln(a.fname);
      writeln('Введите год выпуска:');
      readln(a.year);
      seek(cars, Filesize(cars));
      write(cars, a);
      end;
      close(cars);
end;

if t=3 then begin
  writeln;
  reset(cars);
  writeln('Хотите удалить информацию об автомобиле? Да/Нет');
  readln(k);
  if k ='Да' then
      begin
      writeln('Введите номер автомобиля, который хотите удалить:');
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