program Tfile;

type
  pupil = record
    Name: string[20];
    Surname: string[20];
    Form: string[3];
    FormWord: string[3];
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
        readln(surname);
        write('���:');
        readln(name);
        write('�����:');
        readln(Form);
        write('����� ������:');
        readln(FormWord);
      end;
      write(t, p);
    end;
  Writeln('���������� ����� ���������');
  close(t);
end.