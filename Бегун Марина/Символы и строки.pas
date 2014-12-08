var i: integer;
S1,S2: string;
c:char;
begin
read(S1);
S2:='';
i:=1;
while i<=Length(S1) do begin
  c:=S1[i];
  if c<>'*' then 
    S2:=S2+c+c;
  i:=i+1;
  end;
Writeln(S2);
end.
