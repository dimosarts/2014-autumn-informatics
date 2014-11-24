type
  book=record
  title: string[255];
  author: string[255];
  release_date: integer;
  end;
var
  f:  file of book;
procedure add(f: file of book);
  var p: book;
  begin
  writeln('ВВедите название, автора и год издания(в виде ГГГГММДД) книги');
  read(p.title,p.author,p.release_date);
  reset(f);
  seek(f,filesize(f));
  write(f,p);
  close(f);
  end;
procedure delete(f: file of book);
  var p,q: book;
      title,author: string[255];
      x:  integer;
  begin
  writeln('Введите название и автора книги');
  read(title,author);
  reset(f);  
  seek(f,filesize(f)-1);
  read(f,q);
  seek(f,0);
  while not eof(f) do
    begin
    read(f,p);
    if (p.title=title)and(p.author=author) then
      begin
      x:=filepos(f);
      seek(f,filepos(f)-1);
      write(f,q);
      seek(f,filesize(f)-1);
      truncate(f);
      seek(f,x-1);
      end;
    end;
  close(f);
  end;
procedure later(f: file of book);
  var p: book;
      author: string[255];
      release_date:  integer;
  begin
  writeln('Введите имя автора и дату');
  read(author, release_date);
  reset(f);  
  while not eof(f) do
    begin
    read(f,p);
    if (p.author=author)and(p.release_date>release_date) then writeln(p.title,' ',p.release_date,' ',p.author);
    end;
  close(f);
  end;
begin
  assign(f,'books.dat');
  later(f);
end.