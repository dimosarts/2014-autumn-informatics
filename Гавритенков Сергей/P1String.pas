uses crt;
var s:string;
    i:byte;
begin
readln(s);
i:=2;
     while  i<=length(s) do
       if (s[i]=s[i-1]) and (s[i]='.') then
          delete(s,i,1)
       else
           inc(i);
writeln(s);
end.




