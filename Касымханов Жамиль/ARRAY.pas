
var

  I, Min, Max, L: Integer;
  I1, I2: Integer;
  A: array[1..100] of Integer;
  Summ: Integer;
  
begin

randomize;
L:=random(10);
   FOR I := 1 to L do
      A[I] := random(10);
     begin
   FOR I := 1 to L do
       Write(A[I],' ');
          Writeln; end;

  Summ := 0;
  Min:=A[1];  Max := A[1];

  for I:= 1 to L do
  begin
    if A[I] >= Max then
    begin
      Max := A[I];
      I1 := I;
    end;
    if A[I] <= Min then
    begin
      Min := A[I];
      I2 := I;
    end;
  end;

  if I1 < I2 then
    for I:=I1+1 to I2-1 do
      Summ := Summ + A[I]
  else
    for I:=I2+1 to I1-1 do
      Summ := Summ + A[I];

  WriteLn('Summa: ',Summ);
  readln;

end.