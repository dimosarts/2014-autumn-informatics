uses sysutils;
var s:string;
procedure filegen;
  var f:file of integer;
    i,a:integer;
  begin
  assign(f,'f.txt');
  rewrite(f);
  for i:=0 to (random(20)+1)*5-1 do
    begin
    if i mod 20 < 10
      then a:=random(32000)-32000
      else a:=random(32000);
    if a=0 then inc(a);
    write(f,a);
    end;
  close(f);
  writeln('Сгенерирован файл f.txt, всего элементов - ',i+1);
  end;
procedure fileread(var s:string);
  var f:file of integer;
    i,a:integer;
  begin
  assign(f,s);
  reset(f);
  while eof(f)=false do
    begin
    read(f,a);
    writeln(a);
    end;
  close(f);
  writeln('Чтение файла завершено');
  end;
procedure fileproc;
  var f,g:file of integer;
    i,a:integer;
  begin
  assign(f,'f.txt');
  reset(f);
  i:=0;
  assign(g,'g.txt');
  rewrite(g);
  while eof(f)=false do
    begin
    read(f,a);
    if (i mod 20>4) and (i mod 20<15)
    then
      if i mod 20<10
      then
        begin
        seek(g,i+5);
        write(g,a);
        end
      else
        begin
        seek(g,i-5);
        write(g,a);
        end
    else
      begin
      seek(g,i);
      write(g,a);
      end;
    inc(i);
    end;
  close(f);
  close(g);
  writeln('Данные файла f.txt обработаны. Новый файл g.txt');
  end;

begin
randomize();
writeln('Ожидание ввода');
Writeln('Команды: file gen, file read, file proc');
readln(s);
if s='file gen'
then
  filegen
else if s='file read'
then
  begin
  writeln('Файл?');
  readln(s);
  if fileexists(s)=false
  then
    writeln('не такой файл')
  else
    fileread(s);
  end
else if s='file proc'
then
  fileproc
else
  writeln('неизвестная команда');
writeln('Для завершения нажмите энтер, в случае необходимости перезапустите программу');
readln();
end.
