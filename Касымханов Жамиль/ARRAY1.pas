var

  A: array[1..100] of Integer;
  S, I, L, K, M, Max, Min: Integer;

begin
  WriteLn('¬ведите длину массива: ');
  ReadLn(L);
  WriteLn('¬ведите массив: ');
  for I := 1 to L do
    Read(A[I]);
  ReadLn;
  for I := 1 to L do
  begin
    if A[I] <= Min then
    begin
      Min := A[I];
      K := I;
    end;
    if A[I] >= Max then
    begin
      Max := A[I];
      M := I;
    end;
  end;
  for I := K+1 to M-1 do
    S := S + A[I];
    S := S - A[1];
  WriteLn('Cумма: ', S);
  ReadLn;
end.