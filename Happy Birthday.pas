program konsolnayaotkrytka;
uses crt;
const
  N = 15;
procedure H1;
begin
  for var i:=5 to 11 do begin gotoxy(5,i); write('|'); delay(N); end;
  gotoxy(6,8);
  write('____');
  for var i:=5 to 11 do begin gotoxy(10,i); write('|'); delay(N); end;
end;

procedure A1;
begin
  gotoxy(16,5);
  write('|'); delay(N);
  gotoxy(15,6); write('|');delay(N);
  gotoxy(15,7); write('|');delay(N);
  gotoxy(14,8); write('|');delay(N);
  gotoxy(14,9); write('|');delay(N);
  gotoxy(13,10); write('|');delay(N);
  gotoxy(13,11); write('|');delay(N);
  
  gotoxy(17,6); write('|');delay(N);
  gotoxy(17,7); write('|');delay(N);
  gotoxy(18,8); write('|');delay(N);
  gotoxy(18,9); write('|');delay(N);
  gotoxy(19,10); write('|');delay(N);
  gotoxy(19,11); write('|');delay(N);
  
  gotoxy(15,9); write('___');delay(N);
end;

procedure P1;
begin
  for var i:=5 to 11 do begin gotoxy(22,i); write('|'); delay(N); end;
  gotoxy(23,4); write('____');
  for var i:=5 to 8 do begin gotoxy(27,i); write('|'); delay(N); end;
  gotoxy(23,8); write('____');
end;

procedure P2;
begin
  for var i:=5 to 11 do begin gotoxy(30,i); write('|'); delay(N); end;
  gotoxy(31,4); write('____');
  for var i:=5 to 8 do begin gotoxy(35,i); write('|'); delay(N); end;
  gotoxy(31,8); write('____');
end;

procedure Y1;
begin
  for var i:=5 to 7 do begin gotoxy(38,i); write('|'); delay(N); end;
  for var i:=5 to 7 do begin gotoxy(42,i); write('|'); delay(N); end;
  gotoxy(39,7); write('___'); delay(N);
  for var i:=8 to 11 do begin gotoxy(40,i); write('|'); delay(N); end;
end;

procedure B;
begin
  for var i:=5 to 11 do begin gotoxy(50,i); write('|'); delay(N); end;
  for var i:=5 to 6 do begin gotoxy(54,i); write(')'); delay(N); end;
  gotoxy(51,4); write('___');delay(N);
  gotoxy(51,6); write('___');delay(N);
  for var i:=9 to 11 do begin gotoxy(55,i); write(')'); delay(N); end;
  gotoxy(51,8); write('____'); delay(N); gotoxy(51,11); write('____'); delay(N);
end;

procedure I;
begin
  for var i:=5 to 11 do begin gotoxy(58,i); write('|'); delay(N); end;
end;

procedure R;
begin
  for var i:=5 to 11 do begin gotoxy(61,i); write('|'); delay(N); end;
  for var i:=5 to 7 do begin gotoxy(66,i); write('|'); delay(N); end;
  gotoxy(62,4); write('____'); delay(N);gotoxy(62,7); write('____');delay(N);
  gotoxy(62,8); write('*');delay(N);
  gotoxy(63,9); write('*'); delay(N);
  gotoxy(64,10); write('*');delay(N);
  gotoxy(65,11); write('*'); delay(N);
end;

procedure T;
begin
  for var i:=5 to 11 do begin gotoxy(72,i); write('|'); delay(N);end;
  gotoxy(69,4); write('_______');delay(N);
end;

procedure H2;
begin
  for var i:=5 to 11 do begin gotoxy(78,i); write('|'); delay(N); end;
  gotoxy(79,8);
  write('____');delay(N);
  for var i:=5 to 11 do begin gotoxy(83,i); write('|'); delay(N);end;
end;

procedure D;
begin
  for var i:=5 to 11 do begin gotoxy(87,i); write('|'); delay(N); end;
  gotoxy(88,4); write('__');delay(N); gotoxy(90,5); write('\');delay(N); gotoxy(91,5); write('_');delay(N);
  gotoxy(88,11); write('__/'); delay(N);gotoxy(91,10); write('-');delay(N);
  for var i:=6 to 9 do begin gotoxy(91,i); write('|'); delay(N);end;
end;

procedure A2;
begin
  gotoxy(97,5);
  write('|');delay(N);
  gotoxy(96,6); write('|');delay(N);
  gotoxy(96,7); write('|');delay(N);
  gotoxy(95,8); write('|');delay(N);
  gotoxy(95,9); write('|');delay(N);
  gotoxy(94,10); write('|');delay(N);
  gotoxy(94,11); write('|');delay(N);
  
  gotoxy(98,6); write('|');delay(N);
  gotoxy(98,7); write('|');delay(N);
  gotoxy(99,8); write('|');delay(N);
  gotoxy(99,9); write('|');delay(N);
  gotoxy(100,10); write('|');delay(N);
  gotoxy(100,11); write('|');delay(N);
  
  gotoxy(96,9); write('___');delay(N);
end;

procedure Y2;
begin
  for var i:=5 to 7 do begin gotoxy(102,i); write('|'); delay(N);end;
  for var i:=5 to 7 do begin gotoxy(106,i); write('|'); delay(N);end;
  gotoxy(103,7); write('___');delay(N);
  for var i:=8 to 11 do begin gotoxy(104,i); write('|'); delay(N);end;
end;

procedure znak(x,y: integer);
begin
  for var i:=y to y+4 do begin gotoxy(x,i); write('|'); delay(N); end;
  gotoxy(x,y+5); write('*'); gotoxy(x,y+6); write('*');
end;

procedure smailik(x,y: integer);
begin
  for var i:=y to y+10 do begin gotoxy(x,i); write('|'); delay(N); end;
  for var i:=y to y+10 do begin gotoxy(x+28,i); write('|'); delay(N); end;
   
  gotoxy(x-18,y+9); 
  loop 7 do begin write('***'); gotoxy(wherex,wherey+1); delay(N) end;
  loop 20 do begin write('*'); delay(N); end;
  loop 7 do begin write('***'); gotoxy(wherex,wherey-1); delay(N) end;
end;

procedure HB;
begin
  H1; A1; P1; P2; Y1; B; I; R; T; H2; D; A2; Y2;
end;

procedure init;
begin
  for var k:=1 to 130 do begin write('*'); delay(N); end;
  for var k:=2 to 43 do begin gotoxy(130,k); write('|'); delay(N); end;
  for var k:=130 downto 1 do begin gotoxy(k,44); write('*'); delay(N); end;
  for var k:=43 downto 2 do begin gotoxy(1,k); write('|'); delay(N); end;
end;

//main program 
begin
  //initialization
  crt.HideCursor;
  crt.SetWindowSize(130,45);
  
  
    crt.TextColor(2);

    init;
    HB;
    crt.TextColor(crt.lightRed);
    znak(110,5);
    znak(113,5);
    znak(116,5);
    crt.TextColor(crt.LightGreen);
    smailik(50,15);
  readkey;
end.