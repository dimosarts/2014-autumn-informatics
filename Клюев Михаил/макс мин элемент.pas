program z1;

const
  n = 10;

var
  i, j, max, min: integer;
  a: array[1..n, 1..n]of integer;
  flag, flagone: boolean;

begin
  for i := 1 to n do 
  begin
    for j := 1 to n do 
    begin
      a[i, j] := random(100);
      
      if flagOne = false then 
      begin
        min :=100;
        flagOne := true;
      end;
      
      if a[i, j] < min then min := a[i, j];
      write(a[i, j]:4);
    end;
    
    flagOne := false;
    if flag = false then 
    begin
      max := min;
      flag := true;
    end;
    
    if max < min then max := min; 
    writeln;
  end;
  writeln;
  writeln(max);
end.