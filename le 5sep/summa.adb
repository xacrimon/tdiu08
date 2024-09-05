with Ada.Text_IO;
use Ada.Text_IO;

procedure Summa is
    Sum : Integer := 0;
    Input : Integer := 0;
begin
    for I in 0..5 loop
        Input := Integer'Value(Get_Line);
        Sum := Sum + Input;
    end loop;

    Put_Line("Summan är: " & Integer'Image(Sum));
end Summa;
