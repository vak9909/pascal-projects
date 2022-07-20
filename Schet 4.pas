program schet4;
procedure addition(c:string; var n:integer);
var
  a,b,d: integer;
begin
  while true do
      begin
       a:=random(1000);
       b:=random(1000);
       write('Add: ',a,'+',b,' = ');
       readln(c);
        if c = 'q' then halt
         else if c = 'm' then break
          else if c = 'k' then writeln('Your score = ',n)
           else
            begin
             d:=strtoint(c);
              if d = a+b then 
               begin
                writeln('Correct');
                n:=n+1;
               end
               else writeln('Incorrect(',a+b,')');
            end;
      end;
end;

procedure subt(c: string; var n: integer);
var
  a,b,d: integer;
begin
  begin
     while true do
      begin
       a:=random(1000);
       b:=random(1000);
       write('Subtract: ',a,'-',b,' = ');
       readln(c);
        if c = 'q' then halt
         else if c = 'm' then break
          else if c = 'k' then writeln('Your score = ',n)
           else 
            begin
             d:=strtoint(c);
              if d = a-b then 
               begin 
                writeln('Correct');
                n:=n+1;
               end
               else writeln('Incorrect(',a-b,')');
            end;
      end;
    end;
end;

procedure mult(c: string; var n: integer);
var
  a,b,d: integer;
begin
  while true do
      begin
       a:=random(100);
       b:=random(15);
       write('Multiply: ',a,'*',b,' = ');
       readln(c);
        if c = 'q' then halt
         else if c = 'm' then break
          else if c = 'k' then writeln('Your score = ',n)
           else
            begin
             d:=strtoint(c);
              if d = a*b then 
               begin 
                writeln('Correct');
                n:=n+1;
               end
               else writeln('Incorrect(',a*b,')');
            end;
      end;    
end;

procedure division(c: string; var n: integer);
var
  a,b,d,di: integer;
begin
  while true do
      begin
       a:=random(100);
       b:=random(15);
       di:=a*b;
       write('Divide: ',di,'/',a,' = ');
       readln(c);
        if c = 'q' then halt
         else if c = 'm' then break
          else if c = 'k' then writeln('Your score = ',n)
           else
            begin
             d:=strtoint(c);
              if d = b then 
               begin 
                writeln('Correct');
                n:=n+1;
               end
               else writeln('Incorrect(',di/a,')');
            end;
      end;    
end;

//main program 
label metka;
var //Глобальные переменные
 n: integer; {n - кол-во очков}
 r: char; {r - выбор действия} 
 c: string; {c - вводимый ответ}
begin
 n:=0;
 writeln('Welcome to mental arithmetic training program.');
 metka:
 writeln('Click "+" "-" "*" "/", "q"(quit), "k"(number of points) or "m"(change mode) depending on your preferences.');
 readln(r);
  case r of
   '+': addition(c,n);
   '-': subt(c,n);
   '*': mult(c,n);
   '/': division(c,n);
   'q': halt; 
   'k': writeln('Your score = ',n); 
   else writeln('Incorrect action.'); //К Case of  
  end; //К Case of
 goto metka;
end.