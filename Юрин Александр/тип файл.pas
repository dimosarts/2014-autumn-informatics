type
pupil=record
 surname:string[50];
 firstname:string[50];
 year1:string[4];
 year2:string[4];
 letter:string[1];
end; 
 var 
 surname,firstname:string[50];
 f: file of pupil;
 p,q: pupil; 
 i,j,x,n,k:integer;
 s,s1:boolean;
procedure add(f:file of pupil);
 var p:pupil;
 begin
 //writeln('Введите фамилию, имя, год начала обучения, год конца обучения, буква класса');
  //read(p.surname,p.firstname,p.year1,p.year2,p.letter);
  writeln('Введите фамилию');
  readln(p.surname);
  writeln( 'имя');
  readln(p.firstname);
  writeln('год начала обучения');
  readln(p.year1);
  writeln('год конца обучения');
  readln(p.year2);
  writeln('буква класса');
  readln(p.letter);
  reset (f);
  seek(f,filesize(f));
  write(f,p);
  close(f);
 end;
procedure del(f:file of pupil);
 var p,q:pupil;
 surname,firstname:string[50];
 x:integer;
  begin
   writeln('Введете фамилию');
   readln(surname);
   writeln('имя');
   readln(firstname);
   reset(f);
    while not eof(f) do begin
     read(f,p);
     if (p.surname=surname)and (p.firstname=firstname) then begin
      x:=filepos(f);
      break;
     end;
    end;
   seek(f, FileSize(f)-1);
   read(f, p); 
   seek(f, x-1); 
   write(f, p);
   seek(f, FileSize(f)-1); 
   truncate(f);  
   close(f);
   {while not eof(f) do begin
    read(f,p);
    if (p.surname=surname)and (p.firstname=firstname) then begin
     x:=filepos(f);
     seek(f,filesize(f)-1);
     write(f,p);
     seek(f,filesize(f)-1);
     truncate(f);
     seek(f,x-1);
     end;
   end;
close(f);}
end;   
{begin
assign(f,'C:\Users\k01-221\Desktop\Новая папка\f.txt');
 reset(f);
 n:=filesize(f);
  for i:=1 to n-1 do begin
   for j:=i+1 to n do begin 
    seek(f,i-1);
    read(f,p);
    q:=p;
    seek(f,j-1);
    read(f,p);
    if (q.surname=p.surname) and (q.firstname=p.firstname) and(p.year1=q.year1) and (p.year2=q.year2) and (p.letter=q.letter) then 
    writeln ('имеются однофамильцы в одном классе');
    if (q.surname=p.surname) and (q.firstname=p.firstname) and(p.year1=q.year1) and (p.year2=q.year2) and (p.letter<>q.letter) then
    writeln ('имеются однофамильцы в параллельных классов') ;
   if (q.surname=p.surname) and (q.firstname=p.firstname) then
    writeln ('имеются однофамильцы в школе');
    break;
   break;
    end;
   end;
close(f);

  
   writeln('Введете фамилию');
   readln(surname);
   writeln('имя');
   readln(firstname);
   reset(f);
    while not eof(f) do begin
    read(f,p);
    if (p.surname=surname)and (p.firstname=firstname) then begin
     x:=filepos(f);
     writeln(x);
     break;
     end;
     end;}  // функция del}
begin
repeat 
 writeln('нажмите 1, чтобы добавить ученика');
 writeln('нажмите 2, чтобы удалить ученика');
 writeln('нажмите 3, чтобы просмотреть учеников '); 
 writeln('нажмите 4, чтобы узнать имеются ли однофамильцы в одном классе');
 writeln('нажмите 5, чтобы узнать имеются ли однофамильцы в параллельных классах');
 writeln('нажмите 6, чтобы узнать имеются однофамильцы в школе');
 writeln('нажмите 0, чтобы выйти');
 readln(k);
 if (k=1) then begin assign(f,'C:\Users\k01-221\Desktop\Новая папка\f.txt'); add(f); end;
 if (k=2)then begin assign(f,'C:\Users\k01-221\Desktop\Новая папка\f.txt'); del(f); end;
 if (k=3) then begin
 assign(f,'C:\Users\k01-221\Desktop\Новая папка\f.txt');
 reset(f);
 writeln('фамилия':20,'имя':20,'начало обучения':20,'конец обучения':20,'буква':20);
 while not eof(f) do begin
  read(f,p);
  writeln(p.surname:20,p.firstname:20,p.year1:20, p.year2:20, p.letter:20);
 end;
 close(f);
 end; // проверка записи
if (k=4) then  begin
assign(f,'C:\Users\k01-221\Desktop\Новая папка\f.txt');
 reset(f);
 s:=false;
 n:=filesize(f);
  for i:=1 to n-1 do begin
   for j:=i+1 to n do begin 
    seek(f,i-1);
    read(f,p);
    q:=p;
    seek(f,j-1);
    read(f,p);
    if (q.surname=p.surname) and (q.firstname=p.firstname) and (p.letter=q.letter) then begin
    writeln ('имеются однофамильцы в одном классе');
    s:=true;
      break;
   break;
   end;
    end;
   end;
   if (s=false) then writeln('не имеются');
close(f);
end;
if (k=5) then begin 
assign(f,'C:\Users\k01-221\Desktop\Новая папка\f.txt');
 reset(f);
  s:=false;
 n:=filesize(f);
  for i:=1 to n-1 do begin
   for j:=i+1 to n do begin 
    seek(f,i-1);
    read(f,p);
    q:=p;
    seek(f,j-1);
    read(f,p);
    if (q.surname=p.surname) and (q.firstname=p.firstname) and(p.year1=q.year1) and (p.year2=q.year2) and (p.letter<>q.letter) then begin
    writeln ('имеются однофамильцы в параллельных классах');
    s:=true;
      break;
   break;
   end;
    end;
   end;
    if (s=false) then writeln('не имеются');
close(f);
end;
if (k=6) then begin 
assign(f,'f.txt');
 reset(f);
  s:=false;
 n:=filesize(f);
  for i:=1 to n-1 do begin
   for j:=i+1 to n do begin 
    seek(f,i-1);
    read(f,p);
    q:=p;
    seek(f,j-1);
    read(f,p);
    if (q.surname=p.surname) and (q.firstname=p.firstname)  then begin
    writeln ('имеются однофамильцы в школе');
    s:=true;
      break;
   end;
    end;
    if s then break;
   end;
    if not s then writeln('не имеются');
close(f);
end; 
until k=0;
end.
