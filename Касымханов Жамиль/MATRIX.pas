program ololo;
var

  A: array [1..100, 1..100] of Integer;
  S, I, J, L: Integer;

begin
  Randomize;
  WriteLn('������� �����������: ');
  ReadLn(L);
  for I := 1 to L do
    for J := 1 to L do
      A[I, J] := Random(10);
  for I := 1 to L do
    S := S + A[I, 1] + A[I, L];
  for J := 1 to L do
    S := S + A[1, J] + A[L, J];
  S := S - A[1, 1] - A[1, L] - A[L, 1] - A[L ,L];
  WriteLn('�������: ');
  for I:= 1 to L do
  begin
    for J:= 1 to L do
      Write(A[I, J],'  ');
    WriteLn;
  end;
  WriteLn('C���� ��������� �� ����� �������: ',S);
  ReadLn;
end.