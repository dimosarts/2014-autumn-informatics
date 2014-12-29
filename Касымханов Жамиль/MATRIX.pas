var

  A: array [1..100, 1..100] of Integer;
  S, I, J, L: Integer;

  
begin

randomize;
L:=random(8)+2;
  FOR I := 1 to L do
     FOR J := 1 to L do
        A[I, J] := random(10);
  FOR I := 1 to L do
     begin
        FOR J := 1 to L do
                Write(A[I, J],' ');
                    Writeln;
end;
  
  for I := 1 to L do
    S := S + A[I, 1] + A[I, L];
  for J := 1 to L do
    S := S + A[1, J] + A[L, J];
  S := S - A[1, 1] - A[1, L] - A[L, 1] - A[L ,L];

  WriteLn('Cумма элементов по краям матрицы:',S);


end.