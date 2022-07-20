Program Morze;
Uses Crt;
Var
 s: string;
 j: integer;
Begin 
 writeln('Это программа для перевода текста в код морзе.');
 j:=1;
 while j = 1 do
 begin
 writeln('Введите сообщение для преобразования в код морзе');
 readln(s);
  for var i:=1 to length(s) do
   begin
    Case s[i] of
     'А': write('∙- '); 'а': write('∙- ');
     'Б': write('-∙∙∙ '); 'б': write('-∙∙∙ ');
     'В': write('∙-- '); 'в': write('∙-- ');
     'Г': write('--∙ '); 'г': write('--∙ ');
     'Д': write('-∙∙ '); 'д': write('-∙∙ ');
     'Е': write('∙ '); 'е': write('∙ ');
     'Ё': write('∙ '); 'ё': write('∙ ');
     'Ж': write('∙∙∙- '); 'ж': write('∙∙∙- ');
     'З': write('--∙∙ '); 'з': write('--∙∙ ');
     'И': write('∙∙ '); 'и': write('∙∙ ');
     'Й': write('∙--- '); 'й': write('∙--- ');
     'К': write('-∙- '); 'к': write('-∙- ');
     'Л': write('∙-∙∙ '); 'л': write('∙-∙∙ ');
     'М': write('-- '); 'м': write('-- ');
     'Н': write('-∙ '); 'н': write('-∙ ');
     'О': write('--- '); 'о': write('--- ');
     'П': write('∙--∙ '); 'п': write('∙--∙ ');
     'Р': write('∙-∙ '); 'р': write('∙-∙ ');
     'С': write('∙∙∙ '); 'с': write('∙∙∙ '); 
     'Т': write('- '); 'т': write('- ');
     'У': write('∙∙- '); 'у': write('∙∙- ');
     'Ф': write('∙∙-∙ '); 'ф': write('∙∙-∙ ');
     'Х': write('∙∙∙∙ '); 'х': write('∙∙∙∙ ');
     'Ц': write('-∙-∙ '); 'ц': write('-∙-∙ ');
     'Ч': write('---∙ '); 'ч': write('---∙ ');
     'Ш': write('---- '); 'ш': write('---- ');
     'Щ': write('--∙- '); 'щ': write('--∙- ');
     'Ъ': write('--∙-- '); 'ъ': write('--∙-- ');
     'Ы': write('-∙-- '); 'ы': write('-∙-- ');
     'Ь': write('-∙∙- '); 'ь': write('-∙∙- ');
     'Э': write('∙∙-∙∙ '); 'э': write('∙∙-∙∙ ');
     'Ю': write('∙∙-- '); 'ю': write('∙∙-- ');
     'Я': write('∙-∙- '); 'я': write('∙-∙- ');
     '1': write('∙---- ');
     '2': write('∙∙--- ');
     '3': write('∙∙∙-- ');
     '4': write('∙∙∙∙- ');
     '5': write('∙∙∙∙∙ ');
     '6': write('-∙∙∙∙ ');
     '7': write('--∙∙∙ ');
     '8': write('---∙∙ ');
     '9': write('----∙ ');
     '0': write('----- ');
     ' ': write('    ');
     '.': write('∙∙∙∙∙∙');
     ',': write('∙-∙-∙-');
     '?': write('∙∙--∙∙');
    end; //к case of   
   end; //к циклу for
   writeln;
   end;
 Readkey;  
End.
   