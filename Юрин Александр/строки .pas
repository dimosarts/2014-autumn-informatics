var
  s1,s2:string;
  i:integer;
begin
  read(s1);
  s2:='';
  for i:=1 to length(s1)-1 do begin
    if (s1[i]<>'.') or (s1[i+1]<>'.') then  
        s2:=s2+s1[i];
  end;
  if s1[length(s1)]='.' then s2:=s2+'.';
  writeln(s2);
end.