with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
use Ada.Text_IO;
use Ada.Integer_Text_IO;
use Ada.Float_Text_IO;

procedure Finurlig is
    StrInput : String := "";
    IntInput : Integer := 0;
    FloatInput : Float := 0.0;
begin
    Put("Skriv in ett heltal: ");
    Get(IntInput);
    Put_Line("Du skrev in talet:" & Integer'Image(IntInput));

    -- 1
    New_Line;
    Put("Skriv in fem heltal: ");
    Get(IntInput);
    Put("Du skrev in talen: ");
    Put(IntInput);

    -- 2..5
    Get(IntInput);
    Put(IntInput);
    Get(IntInput);
    Put(IntInput);
    Get(IntInput);
    Put(IntInput);
    Get(IntInput);
    Put(IntInput);

    New_Line;
    Put("Skriv in ett flyttal: ");
    Get(FloatInput);
    Put_Line("Du skrev in flyttalet:" & Float'Image(FloatInput));

    New_Line;
    Put("Skriv in ett heltal och ett flyttal: ");
    Get(IntInput);
    Get(FloatInput);
    Put_Line("Du skrev in heltalet:" & Integer'Image(IntInput));
    Put_Line("Du skrev in flyttalet:" & Float'Image(FloatInput));
end Finurlig;
