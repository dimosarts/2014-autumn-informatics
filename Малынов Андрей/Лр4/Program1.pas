type
  auto_rec = record
    mark: string[20];
    nomer: string[10];
    fio: string[20];
    year: string[10];
  end;

var
  y: string;
  pb: file of auto_rec;
  pr: auto_rec;

begin
  assign(pb, '1.bin');
  reset(pb);
  writeln('������� ����');
  readln(y);  
  while not EOF(pb) do 
  begin
    read(pb, pr);
    if (pr.year > y) then begin
      writeln('�����: ' + pr.mark);
      writeln('�����:' + pr.nomer);
      writeln('�������:' + pr.fio);
      writeln('���: ' + pr.year);
    end;
  end;
  close(pb);
end.