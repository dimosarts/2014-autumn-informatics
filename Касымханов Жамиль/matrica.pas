const
    n = 4;

var
    matrix: array[1..n,1..n] of integer;
    max, min, i, j: integer;

begin

    randomize;
    for i := 1 to n do begin
        for j := 1 to n do begin
            matrix[i,j] := random(100);
            write(matrix[i,j]:3);
        end;
        writeln;
    end;

    max := 0;
    for i := 1 to n do begin
        min := matrix[1,i];
        for j := 2 to n do
            if matrix[i,j] < min then
                min := matrix[i,j];
        if min > max then
            max := min
    end;

    writeln(max);

readln
end.