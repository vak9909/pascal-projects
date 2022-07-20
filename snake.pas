program snake;
uses crt;
const
  N=10;//Задержка действия змейки при повороте
  K=25;//Количество букашек
  L=5;//Длина змейки, включая голову
  Xinit=5; Yinit=5;//Координаты начала змейки
  
type bukashka = record//Тип для создания массива
  num,//Номер(не порядковый) букашки
  x,y: integer;//Координаты этой букашки
                end;
                
var
  axis,vector,c: char;//Ось змейки, направление змейки, для хранения клавиши
  x,y: integer;//Координаты головы змейки
  m: array [1..K] of bukashka;//Массив для хранения данных о букашках
  score: integer;//Очки змейки
  sumofbukashkas: integer;//Сумма значений букашек

procedure fillarrayofbukashka;//Заполняем массив данных о букашках
begin
  for var i:=1 to K do begin m[i].num:=random(1,5); m[i].x:=random(5,95); m[i].y:=random(5,45); end;
end;

procedure drawbukashkas;//Выводим на экран букашки
begin
  for var i:=1 to K do 
  begin 
    gotoxy(m[i].x,m[i].y);//Перейти на место букашки
    case m[i].num of//В зависимости от значение букашки вывести ее разным цветом
      1: textcolor(crt.LightBlue);
      2: textcolor(crt.LightGreen);
      3: textcolor(crt.LightRed); 
      4: textcolor (crt.LightMagenta);
      5: textcolor (crt.Yellow);
    end;
    write(m[i].num); 
  end;
  
  textcolor(crt.LightGray);//После выполнения - включить обычный цвет
end;

procedure drawscore;
begin
  gotoxy(97,48); write(score);
end;

procedure initsnake;//Инициализация змейки
begin
  gotoxy(Xinit,Yinit); x:=Xinit+(L-1); y:=Yinit;
  for var i:=1 to L-1 do write('*');
  write('0');
  axis:='x'; vector:='+';
end;

procedure movexplus;
begin
  gotoxy(x+1,y); write('0'); //Нарисовать доп. элемент
  gotoxy(x-(L-1),y); write(' '); //Убрать лишний элемент
  gotoxy(x,y); write('*'); //Заменить голову
  inc(x); //Изменить координату головы
end;
procedure movexminus;
begin
  gotoxy(x-1,y); write('0'); //Нарисовать доп. элемент
  gotoxy(x+(L-1),y); write(' '); //Убрать лишний элемент
  gotoxy(x,y); write('*'); //Заменить голову
  dec(x); //Изменить координату головы
end;
procedure moveyplus;
begin
  gotoxy(x,y+1); write('0'); //Нарисовать доп. элемент
  gotoxy(x,y-(L-1)); write(' '); //Убрать лишний элемент
  gotoxy(x,y); write('*'); //Заменить голову
  inc(y); //Изменить координату головы
end;
procedure moveyminus;
begin
  gotoxy(x,y-1); write('0'); //Нарисовать доп. элемент
  gotoxy(x,y+(L-1)); write(' '); //Убрать лишний элемент
  gotoxy(x,y); write('*'); //Заменить голову
  dec(y); //Изменить координату головы
end;


procedure rightxplus;
begin
  for var i:=1 to (L-1) do begin gotoxy(x,y+i); write('*'); delay(N); end;//Создать новые точки
  for var i:=1 to (L-1) do begin gotoxy(x-i,y); write(' '); delay(N); end;//Убрать лишние точки
  gotoxy(x,y); write('*'); delay(N);//Убрать голову
  x:=x; y:=y+(L-1);//Изменить координаты головы
  gotoxy(x,y); write('0'); delay(N);//Создать новую голову
  axis:='y'; vector:='+';//Изменить ось и направление змейки
end;
procedure rightxminus;
begin
  for var i:=1 to (L-1) do begin gotoxy(x,y-i); write('*'); delay(N); end;//Создать новые точки
  for var i:=1 to (L-1) do begin gotoxy(x+i,y); write(' '); delay(N); end;//Убрать лишние точки
  gotoxy(x,y); write('*'); delay(N);//Убрать голову
  x:=x; y:=y-(L-1);//Изменить координаты головы
  gotoxy(x,y); write('0'); delay(N);//Создать новую голову
  axis:='y'; vector:='-';//Изменить ось и направление змейки
end;
procedure rightyplus;
begin
  for var i:=1 to (L-1) do begin gotoxy(x-i,y); write('*'); delay(N); end;//Создать новые точки
  for var i:=1 to (L-1) do begin gotoxy(x,y-i); write(' '); delay(N); end;//Убрать лишние точки
  gotoxy(x,y); write('*'); delay(N);//Убрать голову
  x:=x-(L-1); y:=y;//Изменить координаты головы
  gotoxy(x,y); write('0'); delay(N);//Создать новую голову
  axis:='x'; vector:='-';//Изменить ось и направление змейки
end;
procedure rightyminus;
begin
  for var i:=1 to (L-1) do begin gotoxy(x+i,y); write('*'); delay(N); end;//Создать новые точки
  for var i:=1 to (L-1) do begin gotoxy(x,y+i); write(' '); delay(N); end;//Убрать лишние точки
  gotoxy(x,y); write('*'); delay(N);//Убрать голову
  x:=x+(L-1); y:=y;//Изменить координаты головы
  gotoxy(x,y); write('0'); delay(N);//Создать новую голову
  axis:='x'; vector:='+';//Изменить ось и направление змейки
end;


procedure leftxplus;
begin
  for var i:=1 to (L-1) do begin gotoxy(x,y-i); write('*'); delay(N); end;//Создать новые точки
  for var i:=1 to (L-1) do begin gotoxy(x-i,y); write(' '); delay(N); end;//Убрать лишние точки
  gotoxy(x,y); write('*'); delay(N);//Убрать голову
  x:=x; y:=y-(L-1);//Изменить координаты головы
  gotoxy(x,y); write('0'); delay(N);//Создать новую голову
  axis:='y'; vector:='-';//Изменить ось и направление змейки
end;
procedure leftxminus;
begin
  for var i:=1 to (L-1) do begin gotoxy(x,y+i); write('*'); delay(N); end;//Создать новые точки
  for var i:=1 to (L-1) do begin gotoxy(x+i,y); write(' '); delay(N); end;//Убрать лишние точки
  gotoxy(x,y); write('*'); delay(N);//Убрать голову
  x:=x; y:=y+(L-1);//Изменить координаты головы
  gotoxy(x,y); write('0'); delay(N);//Создать новую голову
  axis:='y'; vector:='+';//Изменить ось и направление змейки
end;
procedure leftyplus;
begin
  for var i:=1 to (L-1) do begin gotoxy(x+i,y); write('*'); delay(N); end;//Создать новые точки
  for var i:=1 to (L-1) do begin gotoxy(x,y-i); write(' '); delay(N); end;//Убрать лишние точки
  gotoxy(x,y); write('*'); delay(N);//Убрать голову
  x:=x+(L-1); y:=y;//Изменить координаты головы
  gotoxy(x,y); write('0'); delay(N);//Создать новую голову
  axis:='x'; vector:='+';//Изменить ось и направление змейки
end;
procedure leftyminus;
begin
  for var i:=1 to (L-1) do begin gotoxy(x-i,y); write('*'); delay(N); end;//Создать новые точки
  for var i:=1 to (L-1) do begin gotoxy(x,y+i); write(' '); delay(N); end;//Убрать лишние точки
  gotoxy(x,y); write('*'); delay(N);//Убрать голову
  x:=x-(L-1); y:=y;//Изменить координаты головы
  gotoxy(x,y); write('0'); delay(N);//Создать новую голову
  axis:='x'; vector:='-';//Изменить ось и направление змейки
end;

procedure checkandmove;
begin
  case c of
        'w': if (axis = 'y') and (vector = '-') then moveyminus else
          if (axis = 'x') and (vector = '+') then leftxplus else
          if (axis = 'x') and (vector = '-') then  rightxminus;
        's': if (axis = 'y') and (vector = '+') then moveyplus else
          if (axis = 'x') and (vector = '+') then rightxplus else
          if (axis = 'x') and (vector = '-') then leftxminus;
        'a': if (axis = 'x') and (vector = '-') then movexminus else
          if (axis = 'y') and (vector = '+') then rightyplus else
          if (axis = 'y') and (vector = '-') then leftyminus;
        'd': if (axis = 'x') and (vector = '+') then movexplus else
          if (axis = 'y') and (vector = '+') then leftyplus else
          if (axis = 'y') and (vector = '-') then rightyminus;
        {'r': begin
          if ((axis = 'x') and (vector = '+')) then rightxplus else
          if ((axis = 'x') and (vector = '-')) then rightxminus else
          if ((axis = 'y') and (vector = '+')) then rightyplus else
          if ((axis = 'y') and (vector = '-')) then rightyminus;
              end;
        'l': begin
          if ((axis = 'x') and (vector = '+')) then leftxplus else
          if ((axis = 'x') and (vector = '-')) then leftxminus else
          if ((axis = 'y') and (vector = '+')) then leftyplus else
          if ((axis = 'y') and (vector = '-')) then leftyminus;
        end;}
  end;
end;

procedure init;
var x: integer:=30; y: integer:=16;//Координаты вывода текста. Созданы для удобства написания процедуры.
begin
  gotoxy(x+8,y-4); write('Welcome to snake.');
  gotoxy(x,y+2); write('Use the following keys in the game:');
  gotoxy(x,y+4); write('Press [W] to move the snake up');
  gotoxy(x,y+6); write('Press [S] to move the snake down');
  gotoxy(x,y+8); write('Press [A] to move the snake left');
  gotoxy(x,y+10); write('Press [D] to move the snake right');
  gotoxy(x,y+12); write('Do not get off the game field to ensure the game works properly'); 
  textcolor(crt.LightGreen);
  gotoxy(x,y+14); write('Turn on the English layout');
  textcolor(crt.LightGray);
  gotoxy(x,y+16); write('Press any key to start the game...');
  readkey;
  clrscr;
end;

procedure obvodka;
begin
  for var i:=1 to 100 do begin gotoxy(i,1); write('-'); gotoxy(i,50); write('-'); end;
  for var i:=2 to 49 do begin gotoxy(1,i); write('|'); gotoxy(100,i); write('|'); end;
  gotoxy(1,1);
end;

procedure countsummofbukashkas;
begin
  for var i:=1 to K do sumofbukashkas:=sumofbukashkas+m[i].num;
end;

//main program
begin
  setwindowsize(100,50);
  //sleep(10000);
  hidecursor;
  init;
  initsnake; obvodka; 
  fillarrayofbukashka;
  drawbukashkas;
  score:=0;
  countsummofbukashkas;
  gotoxy(91,48); write('Score: ');
  
  while true do//Бесконечный цикл
  begin
    
    if keypressed then
    begin

      c:=readkey;
      checkandmove;
      
      for var i:=1 to K do //Проверяем, используя весь (массив данных) букашек, не совпадают ли координаты головы змейки и букашки
      begin 
        if (x=m[i].x)and(y=m[i].y) then 
        begin 
          m[i].x:=0; m[i].y:=0;//Обязательно обнулить данные букашки, иначе счет будет увеличиваться при нажатии любой клавиши:
          //                     каждый раз при нажатии клавиши она[букашка] будет находиться в массиве
          score:=score+m[i].num;//Увеличиваем количество очков на соответствующее значение из массива
          
        end; //Если координаты змейки равны коорд. букашки, то счет увел. на 1
      end;
      
      drawscore;
      if score=sumofbukashkas then //Если счет достиг значения суммы букашек, то игра закончена
      begin 
        clrscr; 
        gotoxy(40,24); 
        write('Игра окончена!!!  Ваш счет: ',score); 
        sleep(5000);
        break 
      end;
    end;//Конец блока "если нажата клавиша"
    
  end;//end of 'while true do'
  
end.