with Ada.Text_IO;
use Ada.Text_IO;

procedure Summa is
    Sum : Integer := 0;
    Input : Integer := 0;
    Amount : Integer := 5;
begin
    while Amount /= 0 loop
        Input := Integer'Value(Get_Line);
        Sum := Sum + Input;
        Amount := Amount - 1;
    end loop;

    Put_Line("Summan är: " & Integer'Image(Sum));
end Summa;
