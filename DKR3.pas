uses crt;

function Integral(x: real): real;
begin
  Result := 2 * x * x * x + 2 * x * x - 2 * x + 19;
end;

function Trap(a, b: real; n: integer): real;
var
  h, sum, x: real;
  i: integer;
begin
  h := (b - a) / n;
  sum := (Integral(a) + Integral(b)) / 2;
  x := a;
  for i := 1 to n - 1 do
  begin
    x := x + h;
    sum := sum + Integral(x);
  end;
  Trap := h * sum;
end;

function perv(x: real): real;
begin
  perv := (power(x, 4)) / 2 + (2 * power(x, 3)) / 3 - power(x, 2) + 19 * x;
end;

function Newton(a, b: real): real;
var
  valueAtB, valueAtA: real;
begin
  valueAtB := abs(perv(b));
  valueAtA := abs(perv(a));
  Newton := valueAtB - valueAtA;
end;

function errorCalculation(resul, Newton: real): real;
begin
  errorCalculation := abs(resul - Newton);
end;

procedure DisplayMenu();
begin
  writeln('1. Вычислить определенный интеграл');
  writeln('2. Выход');
end;

var
  choice: char;
  n: integer;
  a, b, result: real;

begin
  clrscr;
  repeat
    DisplayMenu();
    choice := ReadKey;
    clrscr;
    case choice of
      '1': begin
             writeln('Введите нижний предел интегрирования: ');
             readln(a);
             clrscr;
             writeln('Введите верхний предел интегрирования: ');
             readln(b);
             clrscr;
             writeln('Введите количество разбиений: ');
             readln(n);
             clrscr;
             result := Trap(a, b, n);
             clrscr;
             writeln();
             writeln();
             writeln('Результат интегрирования: ', result);
             writeln('Значение интеграла по формуле Ньютона-Лейбница: ', Newton(a,b));
             writeln('Абсолютная погрешность: ', errorCalculation(result, Newton(a, b)):0:5);
             writeln();
             writeln();
             writeln();
             writeln();
             writeln();
             writeln();
             writeln();
           end;
      '2': writeln('Выход');
    end;
  until choice = '2';
end.