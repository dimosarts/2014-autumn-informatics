const N=5;
var
A: array [1..N] of real; 
flag, i: integer;
begin
writeln ('введите начальные элементы последовательности');
for i:=1 to N do readln (A[i]);
flag:=0;
while 1=1 do begin
  for i:=1 to N-1 do begin
    if A[i]>=A[i+1] then begin
      flag:=1;
      break;
    end;
  end;
  if flag=1 then break;
  if A[1]*2<=A[N] then begin
    flag:=1;
    break;
  end;
  for i:=1 to N-1 do begin
    if A[i]*(i+1)>=A[i+1]*(i+2) then begin
      flag:=1;
      break;
    end;
  end;
  break;
end;
if flag=0 
then writeln ('данная последовательность является возрастающей')
else writeln ('данная последовательность не является возрастающей')
end.