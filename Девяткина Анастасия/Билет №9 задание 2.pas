var x,y,z,xkv,ykv,zkv: real;
begin 
writeln ('¬ведите три числа');
read (x, y, z);
if (x=y) or (x=z) or (y=z) 
then begin xkv:=x*x;
writeln (' вадрат первого числа равен ', xkv);
ykv:=y*y;
writeln (' вадрат второго числа равен ', ykv);
zkv:=z*z;
writeln (' вадрат третьего числа равен ', zkv);
end
else 
writeln (x,' ', y,' ', z,' ');
end. 
 
