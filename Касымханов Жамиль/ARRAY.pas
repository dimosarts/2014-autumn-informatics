<<<<<<< HEAD

=======
>>>>>>> 8c8fbcfe6d39c4046e2775ed84d44baabbe90e7a
var

  I, Min, Max, L: Integer;
  I1, I2: Integer;
  A: array[1..100] of Integer;
  Summ: Integer;
<<<<<<< HEAD
  
=======

>>>>>>> 8c8fbcfe6d39c4046e2775ed84d44baabbe90e7a
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
<<<<<<< HEAD
    if A[I] >= Max then
=======
    if A[I] >= Max then 
>>>>>>> 8c8fbcfe6d39c4046e2775ed84d44baabbe90e7a
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
<<<<<<< HEAD
  readln;

end.
=======
end.
>>>>>>> 8c8fbcfe6d39c4046e2775ed84d44baabbe90e7a
