program ololo;
var

  A: array [1..100, 1..100] of Integer;
  S, I, J, L: Integer;

begin
  Randomize;
  WriteLn('Vvedite razmernost');
  ReadLn(L);
  S := 0;
  for I := 1 to L do
    for J := 1 to L do
    begin
      A[I, J] := Random(10);
      S := S + A[I, J];
    end;
  for I := 2 to L-1 do
     for J := 2 to L-1 do
      S := S - A[I, J];
  WriteLn('Matrix: ');
  for I:= 1 to L do
  begin
    for J:= 1 to L do
      Write(A[I, J],'  ');
    WriteLn;
  end;
  WriteLn('Summa: ',S);
end.