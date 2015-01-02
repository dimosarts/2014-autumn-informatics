var
  A: array[1..100,1..100] of Integer;
  I, L, J, x: Integer;
  Summ: Integer;
begin
  Randomize;
  WriteLn('Vvedite razmernost: ');
  ReadLn(L);
var start:=System.DateTime.Now;
  for I:=1 to L do
    for J:=1 to L do
      A[I, J] := Random(10);
  WriteLn('Matrix: ');
  for I:=1 to L do
  begin
    for J:=1 to L do
      Write(A[I, J],'  ');
    WriteLn; 
  end;


  for I:=2 to L-1 do
    Summ := Summ + A[1, I] + A[L, I] + A[I, 1]  + A[I, L];
  Summ := Summ + A[1, 1]  + A[L, L] + A[1, L] + A[L, 1];

  WriteLn('Summa: ');
  WriteLn(Summ);

end.