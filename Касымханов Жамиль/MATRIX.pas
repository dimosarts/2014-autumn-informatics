program ololo;
var

  A: array [1..100, 1..100] of Integer;
  S, I, J, L: Integer;

begin
  WriteLn('������ ࠧ��୮��� ������:');
  ReadLn(L);
  WriteLn('������ ������:');
  for I := 1 to L do
    for J := 1 to L do
      Read(A[I, J]);
  ReadLn;
  for I := 1 to L do
    S := S + A[I, 1] + A[I, L];
  for J := 1 to L do
    S := S + A[1, J] + A[L, J];
  S := S - A[1, 1] - A[1, L] - A[L, 1] - A[L ,L];
  WriteLn('C㬬� ����⮢ �� ��� ������:    ',S);
  ReadLn;


end.