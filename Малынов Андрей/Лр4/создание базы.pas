type
  auto_rec = record
    mark: string[20];
    nomer: string[10];
    fio: string[20];
    year: string[10];
  end;

var
  pb: file of auto_rec;
  pr: auto_rec;
  n, i: integer;

begin
  assign(pb, '1.bin');
  rewrite(pb);
  readln(n);
  for i := 1 to n do 
  begin
    writeln('marka');
    readln(pr.mark);
    writeln('nomer');
    readln(pr.nomer);
    writeln('fio');
    readln(pr.fio);
    writeln('year');
    readln(pr.year);
  write(pb,pr);
  end;
  close(pb);
end.