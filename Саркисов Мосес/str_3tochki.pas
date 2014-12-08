program f1;
var i, j, n, k, z:  integer;
    s:              string;
begin
readln(s);
k:=length(s);
i:=1;
s:=s+'0';
while i<k do
  begin
  if s[i]='.' then
    begin
    j:=0;
    while s[i]='.' do
      begin
      j:=j+1;
      i:=i+1;
      end;
    if j=1 then continue;
    if j=2 then 
      begin
      insert('.',s,i-j);
      i:=i+1;
      continue;
      end;
    if j=3 then 
      begin
      i:=i+1;
      continue;
      end;
    if j>3 then 
           begin
           delete(s,i-j,j-3);
           i:=i-j+3;
           k:=k-j+3;
           for n:=1 to (length(s)-j+3) do s:=s+'0';
           end;
    z:=z+n;
    end;
  i:=i+1;
  end;
delete(s,length(s)-z,z+2);
writeln(s);
end.