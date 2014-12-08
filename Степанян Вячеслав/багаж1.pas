TYPE
 jir = record
  fio: string[20];
  kolvo: integer;
  ves: real;
end;
VAR
 spisok: jir;
 sp: file of jir;
 n, i:integer;
begin
 writeln ('введите количество пассажиров');
 readln (n);
 assign (sp,'C:\mephi\passajir.txt');
 rewrite (sp);
 with spisok do
 for i:=1 to n do
  begin
   writeln ('¬ведите фамилию пассажира');
   readln (fio);
   writeln ('¬ведите количество вещей');
   readln (kolvo);
   writeln ('¬ведите общий вес багажа');
   readln (ves);
   write (sp, spisok);
  end;
 close (sp);
end.