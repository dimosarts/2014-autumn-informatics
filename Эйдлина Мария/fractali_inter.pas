program fractal_int;

uses
  GraphABC;

const
  N = 1024;
  M = 768;
  pmin = -2.25;
  pmax = 1.25;
  qmin = -1.25;
  qmax = 1.25;

type
  NewArray = array[0..N - 1, 0..M - 1] of byte;

var
  c, pal: byte;
  l: NewArray;
  e, t: real;

procedure Mandelbrot(var a: NewArray);{Построение мн-ва Мандельброта}
const
  R1 = 10;
var
  dp, dq, p, q, x, y, xp, yp: real;
  j, i, k: word;
  f1: file of byte;
begin
  Assign(f1, 'C:\Users\k01-221\2014-autumn-informatics\Эйдлина Мария\1.txt');
  Rewrite(f1);
  reset(f1);
  dp := (pmax - pmin) / N;
  dq := (qmax - qmin) / M;
  for j := 0 to N - 1 do
    for i := 0 to M - 1 do
    begin
      p := pmin + j * dp;
      q := qmin + i * dq;
      k := 0;
      xp := 0;
      yp := 0;
      x := 0;
      y := 0;
      while (sqr(x) + sqr(y) <= R1) do
      begin
        x := sqr(xp) - sqr(yp) + p;
        y := 2 * xp * yp + q;
        xp := x;
        yp := y;
        k := k + 1;
        if k = 256 then
        begin
          k := 0;
          break;
        end;
      end; 
      a[j, i] := k;
      write(f1, a[j, i]);
    end;
   close(f1); 
end;

procedure Julia(p, q: real; var a: NewArray);{Построение мн-ва Жюлиа}
const
  R1 = 10;
var
  dp, dq, x, y, xp, yp: real;
  j, i, k: word;
  e, l: integer;
  f2: file of byte;
begin
  Assign(f2, 'C:\Users\k01-221\2014-autumn-informatics\Эйдлина Мария\2.txt');
  Rewrite(f2);
  reset(f2);
  dp := (pmax - pmin) / N;
  dq := (qmax - qmin) / M;  
  for j := 0 to N - 1 do
    for i := 0 to M - 1 do
    begin
      e := (N div 2) + 1 - j;
      l := (M div 2) + 1 - i; 
      k := 0;
      xp := dp * e;
      yp := dq * l;
      x := xp;
      y :=  yp;
      while (sqr(x) + sqr(y) <= R1) do
      begin
        x := sqr(xp) - sqr(yp) + p;
        y := 2 * xp * yp + q;
        xp := x;
        yp := y;
        k := k + 1;
        if k = 256 then
        begin
          k := 0;
          break;
        end;
      end; 
      a[j, i] := k;
      write(f2, a[j, i]);
    end; 
   close(f2); 
end;

procedure Palitra(o: NewArray; pal1: byte);{Палитра и вывод на экран}
var
  r, g, b, w, v, d: byte;
  cm: array[0..255] of color;
  j, i: integer;
begin
  if pal1 = 1 then
  begin
    w := 0;
    v := 0;
    d := 7;
  end;
  if pal1 = 2 then
  begin
    w := (w + 4) div 2;
    v := 0;
    d := 0;
  end;
  if pal1 = 3 then
  begin
    w := 0;
    v := (d + 9) div 3;
    d := 0;
  end;
  r := 0;
  g := 0;
  b := 0;
  for i := 1 to 255 do
  begin
    r := r + 1 + w;
    g := g + 2 + v;
    b := b + d;
    cm[i] := RGB(r, g, b);
  end;
  cm[0] := clBlack;
  ClearWindow; 
  for j := 0 to N - 1 do 
    for i := 0 to M - 1 do 
      Setpixel(j, i, cm[o[j, i]]);
end;

begin
  c := 0;
  pal := 0;
  SetWindowSize(N, M);
  CenterWindow; 
  writeln('Выберите множество:');
  writeln('Введите 1 для множества Мандельброта');
  writeln('Введите 2 для множества Жюлиа');
  readln(c);
  writeln;
  writeln('Выберите палитру:');
  writeln('Введите 1 для палитры1');
  writeln('Введите 2 для палитры2');
  writeln('Введите 3 для палитры3');
  writeln;
  readln(pal);
  if c = 1 then 
  begin
    Mandelbrot(l);
    Palitra(l, pal);
  end
   else
  begin
    writeln('Введите координаты точки');
    read(e, t);
    Julia(e, t, l);
    Palitra(l, pal);
  end;
end.