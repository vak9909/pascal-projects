program vsp21;
var b: array [1..45] of char:=(' ','f','j','d','k','s','l','a',';','g','h',
                              'r','u','e','i','w','o','q','p','t','y',
                              'c','m','v','n','b','x',',','z','.','/',
                              '1','2','3','4','5','6','7','8','9','0',
                              '-','=','[',']');

procedure obnov(lvl, n: integer);//n-кол-во элементов из массива, которые используются
  var//lvl-номер уровня
    fname: string;
    f: text;
  begin
    fname:='urovni\urov'+inttostr(lvl)+'.txt';
    assign(f,fname);
    
    rewrite(f);
    for var i:=1 to 10 do
      begin
        for var j:=1 to 110 do 
          begin
            write(f,b[random(1,n)]);
          end;
        writeln(f);
      end;
    close(f);
  end;

//main program
begin
  mkdir('urovni');
  for var k:=1 to 11 do obnov(k,2*k+1);
  obnov(12,26);
  obnov(13,28);
  obnov(14,31);
  for var k:=15 to 21 do obnov(k,2*k+3);
end.
