program Tfile;

type
  pupil = record
    Name: string[8];
    Surname: string[7];
    Form: string[3];
    FormWord: string[2];
  end;

var
  
  p: pupil;
  t: file of pupil;
  i, n: integer;



begin
  assign(t, 'class.db');
  rewrite(t);
  Writeln('������� ���������� ��������');
  readln(n);
  for i := 1 to n do 
    with p do 
    begin
      begin
        write(i, '-�� �������:');
        read(surname);
        write('���:');
        read(name);
        write('�����:');
        read(Form);
        write('����� ������:');
        read(FormWord);
      end;
      write(t, p);
    end;
  Writeln('�������� ������ ��������');
  close(t);
end.