uses Timers;

var
  S: String;
  I, P, x: Integer;

begin
  WriteLn('Vvedite stroku:');
  ReadLn(S);

    var start:=System.DateTime.Now;

  for x := 1 to 1000000000 do
  p:=0;
  For I:= Length(S) downto 1 do
  If S[I] = ',' then begin p:=I; break;  end;
  WriteLn('Poziciya poslednei zapyatoi: ', P);

    var finish:=System.DateTime.Now;
    writeln((finish-start).TotalMilliseconds);
<<<<<<< HEAD
    readln;
 
end.
=======
end.
>>>>>>> 8c8fbcfe6d39c4046e2775ed84d44baabbe90e7a
