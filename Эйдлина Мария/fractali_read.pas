program fractali_read1;

uses
  GraphABC;

const
  N = 1024;
  M = 768;

var
  f1: file of byte;
  a: array[0..N - 1, 0..M - 1] of byte;
  cm: array[0..255] of color;
  r, g, b: byte;
  i, j: word;

begin
  Assign(f1, 'C:\Users\k01-221\2014-autumn-informatics\Эйдлина Мария\1.txt');
  reset(f1);
  for i := 0 to N - 1 do
    for j := 0 to M - 1 do
      read(f1, a[i, j]);
  close(f1);
  r := 0;
  g := 0;
  b := 0;
  for i := 1 to 255 do
  begin
    r := r + 1;
    g := g + 2;
    b := b + 7;
    cm[i] := RGB(r, g, b);
  end;
  cm[0] := clBlack;
  
  SetWindowSize(N, M);
  for i := 0 to N - 1 do
    for j := 0 to M - 1 do 
      Setpixel(i, j, cm[a[i, j]]);
end.