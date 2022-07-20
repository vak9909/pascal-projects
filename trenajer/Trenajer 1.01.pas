program Trenajer;
uses GraphABC;
const rkn=30;//Размер клавиш на виртуальной клавиатуре
  N=50;//Количество виртуальных клавиш на виртуальной клавиатуре
type TBaz = class
  px,py: integer;//Координаты объекта
  w,h: integer;//Ширина и высота объекта
  str: string;//Текст на объекте
  constructor (xx,yy,ww,hh: integer);
    begin
      px:=xx; py:=yy; w:=ww; h:=hh;
      draw;
    end;
  procedure draw; virtual;
    begin
      setbrushcolor(clLightGray);
      setpencolor(clBlack);
      rectangle(px,py,px+w,py+h);
      textout(px+round((w)/2-textwidth(str)/2),  
        py+round((h)/2-textheight(str)/2),
          str);
    end;
  procedure clear;
    begin
      setbrushcolor(clWhite);
      setpencolor(clWhite);
      rectangle(px,py,px+w,py+h);
    end;
  function voblasti(xx,yy: integer): boolean; 
    begin
      if (xx>px)and(xx<px+w)and(yy>py)and(yy<py+h) then result:=true
        else result:=false;
    end;
end;//class TBaz

type Tinputlvl = class (TBaz)//Поле ввода уровня
  naj: boolean;//Выбрано ли именно это поле
  procedure pressed;//Если выбрано это поле, то оно должно быть темнее
    begin
      setbrushcolor(clGray);
      setpencolor(clBlack);
      rectangle(px,py,px+w,py+h);
      textout(px+w-textwidth(str),  
        py+round((h)/2-textheight(str)/2),
          str);
    end;
  procedure draw; override;
    begin
      setbrushcolor(clLightGray);
      setpencolor(clBlack);
      rectangle(px,py,px+w,py+h);
      textout(px+w-textwidth(str),  
        py+round((h)/2-textheight(str)/2),
          str);
    end;
    
end;//class inputlvl

var inxt, inyt: integer;//Координаты символа, вводимого с клавиатуры
const 
  STROK=10;//Кол-во строк, содержащихся в текстовом файле
  STOLB=110;//Кол-во символов, содержащихся в каждой строке текстового файла

type Tinputtxt = class (TBaz)
  naj: boolean;//Выбрано ли именно это поле
  procedure pressed;//Если выбрано это поле, то оно должно быть темнее
    begin
      setbrushcolor(clGray);
      setpencolor(clBlack);
      rectangle(px,py,px+w,py+h);
      textout(px+5,py+5,str);
    end;
  procedure draw; override;
    begin
      setbrushcolor(clLightGray);
      setpencolor(clBlack);
      rectangle(px,py,px+w,py+h);
      textout(px+5,py+5,str);
    end;
    
end;//class inputtxt

type Tkeyb = class (TBaz)//Класс для клавиатуры

end;//class keyb

type Tknopka = class (TBaz)
  procedure podsv;
    begin
      setbrushcolor(clLightGreen);
      setpencolor(clBlack);
      rectangle(px,py,px+w,py+h);
      textout(px+round((w)/2-textwidth(str)/2),  
        py+round((h)/2-textheight(str)/2),
          str);
    end;
  
end;//class knopka



var fname: string;//Имя файла
  ftext: text;//Файловая переменная
  ur: integer;//Текущий уровень
  symb: array [1..STROK] of array [1..STOLB] of char;//Массив символов из файла

type Toutputtxt = class (TBaz)//Поле вывода текста из файла
  x0,y0: integer;//Левый верхний угол поля
  procedure urov(n: integer);//Чтение из файла и вывод на экран
    var c: char;//Вспомогательная переменная для чтения
    begin
      x0:=165; y0:=35;//В координатах (165; 35)
      fname:='urovni\urov'+inttostr(ur)+'.txt';
      assign(ftext,fname);
      reset(ftext);
      
      for var i:=1 to STROK do begin//Заполнение массива symb
        
        for var j:=1 to STOLB do begin
          read(ftext,c);
          symb[i,j]:=c;
        end;
        readln(ftext);
      end;///Заполнение массива symb
      
      close(ftext);
      
      begin//Вывод на экран массива symb
        setbrushcolor(clLightGray);
        var xt,yt: integer;//Координаты выводимого символа
        xt:=x0; yt:=y0;
        for var i:=1 to STROK do
          begin
            for var j:=1 to STOLB do
              begin
                textout(xt,yt,symb[i,j]);
                xt:=xt+textwidth(symb[i,j]);
              end;
            yt:=yt+textheight(symb[i,1]);
            xt:=x0;
          end;
      end;///Вывод на экран массива symb
      
    end;//urov(n: integer)
    
end;//class outputtxt

var//Раздел описания переменных
  inputlvl: Tinputlvl:=new Tinputlvl(20,30,100,20);
  outputtxt: Toutputtxt:=new Toutputtxt(160,30,1000,175);
  inputtxt: Tinputtxt:=new Tinputtxt(160,240,1000,175);
  keyb: Tkeyb:=new Tkeyb(300,450,580,210);
  
  kn: array [1..N] of Tknopka; //Здесь будут объекты клавиш
  
  str,stb: integer;//Номер строки и столбца при вводе текста с клавы
  mist,score: integer;//Кол-во ошибок и очков при вводе текста с клавы
  block: boolean;//Блокировка, отвечающая за ввод с клавиатуры


procedure initkeyb;//Инициализируем координаты виртуальных клавиш
  var x0,y0: integer;
  begin
    x0:=keyb.px+30; y0:=keyb.py+10;
    for var i:=1 to N do kn[i]:=new Tknopka(x0,y0,30,30);
    kn[13].w:=60; kn[38].w:=60; kn[49].w:=90; kn[50].w:=190;
    kn[37].w:=70;//Длина и высота клавиш
    
    for var i:=1 to 13 do kn[i].px:=x0+(i-1)*40;//Первый ряд
    for var i:=14 to 25 do begin kn[i].px:=x0+(i-14)*40+20; kn[i].py:=y0+40; end;//Второй ряд
    for var i:=26 to 37 do begin kn[i].px:=x0+(i-26)*40+30; kn[i].py:=y0+80; end;//Третий ряд
    kn[38].px:=x0-20; kn[38].py:=y0+120;//Левый SHIFT
    for var i:=39 to 49 do begin kn[i].px:=x0+(i-39)*40+50; kn[i].py:=y0+120; end;//Последний ряд
    kn[50].px:=x0+130; kn[50].py:=y0+160;//Пробел
    
      //Заполнение поля str, то есть символов на виртуальных клавишах
      for var i:=1 to 9 do kn[i].str:=inttostr(i);
      kn[10].str:='0';           kn[31].str:='H';
      kn[11].str:='-';           kn[32].str:='J';
      kn[12].str:='=';           kn[33].str:='K';
      kn[13].str:='Backspace';   kn[34].str:='L';
      kn[14].str:='Q';           kn[35].str:=';';
      kn[15].str:='W';           kn[36].str:='"';
      kn[16].str:='E';           kn[37].str:='Enter';
      kn[17].str:='R';           kn[38].str:='SHIFT';
      kn[18].str:='T';           kn[39].str:='Z';
      kn[19].str:='Y';           kn[40].str:='X';
      kn[20].str:='U';           kn[41].str:='C';
      kn[21].str:='I';           kn[42].str:='V';
      kn[22].str:='O';           kn[43].str:='B';
      kn[23].str:='P';           kn[44].str:='N';
      kn[24].str:='[';           kn[45].str:='M';
      kn[25].str:=']';           kn[46].str:=',';
      kn[26].str:='A';           kn[47].str:='.';
      kn[27].str:='S';           kn[48].str:='/';
      kn[28].str:='D';           kn[49].str:='SHIFT';
      kn[29].str:='F';           kn[50].str:='Space';
      kn[30].str:='G';
    
    for var i:=1 to N do kn[i].draw;//Рисование всех клавиш

  end;//procedure initkeyb
  
procedure keypress(ch: char);
  begin
    case ch of//Подсветка клавиатуры
      '1': kn[1].podsv;  'a': kn[26].podsv; ';': kn[35].podsv;
      '2': kn[2].podsv;  's': kn[27].podsv; '"': kn[36].podsv;
      '3': kn[3].podsv;  'd': kn[28].podsv; ',': kn[46].podsv;
      '4': kn[4].podsv;  'f': kn[29].podsv; '.': kn[47].podsv;
      '5': kn[5].podsv;  'g': kn[30].podsv; '/': kn[48].podsv;
      '6': kn[6].podsv;  'h': kn[31].podsv;
      '7': kn[7].podsv;  'j': kn[32].podsv;
      '8': kn[8].podsv;  'k': kn[33].podsv;
      '9': kn[9].podsv;  'l': kn[34].podsv;
      '0': kn[10].podsv;  'z': kn[39].podsv;
      'q': kn[14].podsv;  'x': kn[40].podsv;
      'w': kn[15].podsv;  'c': kn[41].podsv;  
      'e': kn[16].podsv;  'v': kn[42].podsv;
      'r': kn[17].podsv;  'b': kn[43].podsv;
      't': kn[18].podsv;  'n': kn[44].podsv;
      'y': kn[19].podsv;  'm': kn[45].podsv;
      'u': kn[20].podsv;  '-': kn[11].podsv;
      'i': kn[21].podsv;  '=': kn[12].podsv;
      'o': kn[22].podsv;  '[': kn[24].podsv;
      'p': kn[23].podsv;  ']': kn[25].podsv;
      //Чтобы заглавные буквы тоже работали
      'Q': kn[14].podsv;  'A': kn[26].podsv; 'Z': kn[39].podsv;
      'W': kn[15].podsv;  'S': kn[27].podsv; 'X': kn[40].podsv;
      'E': kn[16].podsv;  'D': kn[28].podsv; 'C': kn[41].podsv; 
      'R': kn[17].podsv;  'F': kn[29].podsv; 'V': kn[42].podsv;
      'T': kn[18].podsv;  'G': kn[30].podsv; 'B': kn[43].podsv;
      'Y': kn[19].podsv;  'H': kn[31].podsv; 'N': kn[44].podsv;
      'U': kn[20].podsv;  'J': kn[32].podsv; 'M': kn[45].podsv;
      'I': kn[21].podsv;  'K': kn[33].podsv; 
      'O': kn[22].podsv;  'L': kn[34].podsv; 
      'P': kn[23].podsv;
    end;//case of. Подсветка клавиатуры
        
    if (inputlvl.naj)and(ch in ['0'..'9']) then 
      begin
        if (length(inputlvl.str)>11) then delete(inputlvl.str,1,1);
        inputlvl.str:=inputlvl.str+ch;
        inputlvl.pressed;
      end;
    
    if (inputtxt.naj)and(block=false) then
      begin
        stb:=stb+1;
        if (ch=symb[str,stb]) then//Выводим символ на экран соотв. цветом:
          begin
            inc(score); setbrushcolor(clWhite); textout(10,130,score);
            setbrushcolor(clLightGray);//Обычным
            textout(inxt,inyt,ch);
          end
          else
            begin
              inc(mist); setbrushcolor(clWhite); textout(10,190,mist);
              setbrushcolor(clRed);//Или красным, если ошибка
              textout(inxt,inyt,ch);
            end;
            
        inxt:=inxt+textwidth(ch);
        
        if (stb>=110) then begin inc(str); stb:=0; inxt:=165; 
          inyt:=inyt+textheight(ch); end;
        
        if (str=11)and(stb=0) then //Когда закончили ввод текста
          begin
            block:=true;
            setbrushcolor(clWhite);
            var procentmist: real;//Вспом. для процента ошибок
            procentmist:=round(mist/1100*100,2);
            textout(200,215,'Вы прошли уровень, допустив '+inttostr(mist)+' ошибок. Процент ошибок = '+procentmist);
          end;
      end;
      
    setbrushcolor(clGray);//Реализация курсора
    if not((str=11)and(stb=0)) then textout(inxt,inyt-209,symb[str,stb+1]);//Закрашивание следующей клавиши
    
    //textout(10,230,inttostr(str)+' '+inttostr(stb)+'    ');//тестовая функция(отображение str и stb
    
    setbrushcolor(clLightGray);
    if (inxt=165)and(str>=2) then textout(1146,inyt-226,symb[str-1,110]);
    if (inxt<>165) then textout(inxt-9,inyt-209,symb[str,stb]);
    //Удаление курсора с предыдущей клавиши
    
  end;//for keypress(ch:char)
  
procedure keydown(key: integer); 
  begin
    case key of//Подсвечивание служебных клавиш
      8: kn[13].podsv;//Backspace
      13: kn[37].podsv;//Enter
      32: kn[50].podsv;//Space

    end;//case of
    
    if (inputlvl.naj)and(key=8) then//Если нажат Backspace в поле ввода уровня
      begin
        delete(inputlvl.str,length(inputlvl.str),1);//Стереть символ
        inputlvl.pressed;//Перерисовать поле
      end;
    
    if (inputlvl.naj)and(key=13) then//Если нажат Enter, то читаем имя файла
      begin//(уровень)
        ur:=strtoint(inputlvl.str); 
        inputlvl.str:=''; inputlvl.pressed;
        outputtxt.urov(ur);//Чтение из файла и вывод на экран
        
        block:=false;//Снять блокировку ввода и удалить то итоговое сообщение
        setbrushcolor(clWhite);
        textout(200,215,'                                                               ');
        
        str:=1; stb:=0;//Сбросить счетчики, чтобы счет пошел заново
        inxt:=165; inyt:=245;
        score:=0; mist:=0;
        setbrushcolor(clWhite);
        textout(10,130,'          ');
        textout(10,190,'          ');
        floodfill(161,241,clLightGray);
        inputtxt.clear; inputtxt.draw;
      end;
    
  end;//keydown (key: integer)
  
procedure keyup(key: integer);
  begin
    case key of//Чтобы при отжатии клавиши убирать подсветку
      8: kn[13].draw;//Backspace
      13: kn[37].draw;//Enter
      32: kn[50].draw;//Space
      
      48: kn[10].draw;{0}  65: kn[26].draw;{A} 189: kn[11].draw;//-
      49: kn[1].draw;{1}   83: kn[27].draw;{S} 187: kn[12].draw;//=
      50: kn[2].draw;{2}   68: kn[28].draw;{D} 219: kn[24].draw;//[
      51: kn[3].draw;{3}   70: kn[29].draw;{F} 221: kn[25].draw;//]
      52: kn[4].draw;{4}   71: kn[30].draw;{G} 186: kn[35].draw;//;
      53: kn[5].draw;{5}   72: kn[31].draw;{H} 222: kn[36].draw;//'
      54: kn[6].draw;{6}   74: kn[32].draw;{J} 188: kn[46].draw;//,
      55: kn[7].draw;{7}   75: kn[33].draw;{K} 190: kn[47].draw;//.
      56: kn[8].draw;{8}   76: kn[34].draw;{L} 191: kn[48].draw;//'/'
      57: kn[9].draw;{9}
      
      81: kn[14].draw;{Q}  90: kn[39].draw;{Z}
      87: kn[15].draw;{W}  88: kn[40].draw;{X}
      69: kn[16].draw;{E}  67: kn[41].draw;{C}
      82: kn[17].draw;{R}  86: kn[42].draw;{V}
      84: kn[18].draw;{T}  66: kn[43].draw;{B}
      89: kn[19].draw;{Y}  78: kn[44].draw;{N}
      85: kn[20].draw;{U}  77: kn[45].draw;{M}
      73: kn[21].draw;{I}
      79: kn[22].draw;{O}
      80: kn[23].draw;{P}
      //И т.д.
    end;//case of. Убрать подсветку
    
  end;
 
procedure mousedown(xx,yy,mb: integer);
  begin
    if ((inputlvl.voblasti(xx,yy))=true)and(mb=1) then//Условие выбора поля
      begin//ввода уровня
        inputlvl.naj:=true; inputtxt.naj:=false;
        inputlvl.pressed;  setbrushcolor(clWhite); 
        textout(30,300,'                '); textout(80,320,'         ');
        {inputtxt.draw;}
        //При выборе поля ввода уровня убираем стрелочку
      end;
      
    if (inputtxt.voblasti(xx,yy)=true)and(mb=1) then//Условие выбора поля
      begin//ввода текста
        inputtxt.naj:=true; inputlvl.naj:=false;
        setbrushcolor(clWhite);
        textout(30,300,'Набирайте здесь:'); textout(80,320,'------>>>'); 
        {inputtxt.pressed;} inputlvl.draw;
        //При нажатии на поле ввода текста рисуем стрелочку для удобства
      end;
  end;

  
//main program
begin
  exec('vsp21.exe');
  setwindowtitle('Trenajer 1.01');
  graphabc.SetWindowSize(1280,680);
  setfontname('Courier New');
  initkeyb;
  onkeydown:=keydown;
  onkeyup:=keyup;
  onkeypress:=keypress;
  onmousedown:=mousedown;
  str:=1; stb:=0;
  inxt:=165; inyt:=245;
  setbrushcolor(clWhite);
  textout(10,100,'Очки: ');
  textout(10,160,'Ошибки: ');
end.
