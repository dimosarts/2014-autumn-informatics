
TYPE
 jir = record
  fio: string[20];
  kolvo: integer;
  ves: real;
end;
VAR
 spisok: jir;
 sp: file of jir;
 k:boolean;
begin
 k:=false;
 assign (sp,'C:\mephi\passajir.txt');
 reset (sp);
 while not eof (sp) do
  begin
   read (sp, spisok);
    with sp do begin
     if (spisok.kolvo=1) and (spisok.ves>=30) then
      k:=true;
    end; 
  end;
 close (sp);
 if k=true then
  writeln ('такой пассажир есть')
 else
  writeln ('такого пассажира нет');
end.