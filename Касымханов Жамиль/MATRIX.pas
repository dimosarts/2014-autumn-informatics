program ololo;
var

  A: array [1..100, 1..100] of Integer;
  S, I, J, L: Integer;

begin
  Randomize;
  WriteLn('Введите размерность: ');
  ReadLn(L);
  for I := 1 to L do
    for J := 1 to L do
      A[I, J] := Random(10);
  for I := 1 to L do
    S := S + A[I, 1] + A[I, L];
  for J := 1 to L do
    S := S + A[1, J] + A[L, J];
  S := S - A[1, 1] - A[1, L] - A[L, 1] - A[L ,L];
  WriteLn('Матрица: ');
  for I:= 1 to L do
  begin
    for J:= 1 to L do
      Write(A[I, J],'  ');
    WriteLn;
  end;
  WriteLn('Cумма элементов по краям матрицы: ',S);
  ReadLn;
end.