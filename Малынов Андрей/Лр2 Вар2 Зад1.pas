const n=10;
var a:array [1..n]of integer;
b: boolean;
i:integer;
begin
 writeln('������� ������ �� n �����' );
 for i:=1 to n do 
  read(a[i]);
  b:=true;
 for i:=1 to ((n div 2)) do 
  if a[i]<>a[n-i+1] then 
   begin 
   b:=false;
   break;
   end;
 if b then
  writeln('�������� ����������� ') 
 else 
  writeln('�� �������� ����������� ');
end.  