program ololo;
<<<<<<< HEAD


=======
>>>>>>> 8c8fbcfe6d39c4046e2775ed84d44baabbe90e7a
var

  A: array [1..100, 1..100] of Integer;
  S, I, J, L: Integer;

begin
{randomize;
L:=random(10); 
   FOR I := 1 to L do
      A[I] := random(10);
     begin
   FOR I := 1 to L do
       Write(A[I],' ');
          Writeln; end;}
  WriteLn('Vvedite razmernost');
  ReadLn(L);
  WriteLn('Vvedite matricu');
  S := 0;
  for I := 1 to L do
    for J := 1 to L do
    begin
      Read(A[I, J]);
<<<<<<< HEAD
      S := S + A[I, J];
=======
      S := S + A[I, J]; 
>>>>>>> 8c8fbcfe6d39c4046e2775ed84d44baabbe90e7a
    end;
  ReadLn;
  for I := 2 to L-1 do
     for J := 2 to L-1 do
      S := S - A[I, J];
  WriteLn('Summa: ',S);
<<<<<<< HEAD
  readln;


end.
=======



end.
>>>>>>> 8c8fbcfe6d39c4046e2775ed84d44baabbe90e7a
