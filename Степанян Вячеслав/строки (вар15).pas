procedure slovo (s:string;var w:string);
 var i:integer;
  begin
   w:='';
   s:=' '+s;
   for i:=2 to length(s) do
    if ord(s[i])>=ord(s[i-1]) then
     w:=w+s[i];
   delete(s,1,1);
   if s<>w then
    w:='';
  end;
var c:char;
    s,w,z:string;
    k1,k2:integer;
begin
  while 1=1 do
   begin
    read (c);
    s:=s+c;
    if c='.' then
     break;
  end;
  delete(s,length(s),1);
  s:=' '+s+' ';
  k2:=1;
  while 1=1 do
   begin
    k1:=pos(' ',s);
    delete(s,k1,1);
    k2:=pos(' ',s);
    if k2=0 then
     break;
    if k2<>k1 then
     begin
      w:=copy(s,k1,k2-k1);
      slovo(w,z);
      if z<>'' then
       write(z,' ');
     end;
   end;
end.