var x,y,z,xkv,ykv,zkv: real;
begin 
writeln ('������� ��� �����');
read (x, y, z);
if (x=y) or (x=z) or (y=z) 
then begin xkv:=x*x;
writeln ('������� ������� ����� ����� ', xkv);
ykv:=y*y;
writeln ('������� ������� ����� ����� ', ykv);
zkv:=z*z;
writeln ('������� �������� ����� ����� ', zkv);
end
else 
writeln (x,' ', y,' ', z,' ');
end. 
 
