-- matol699: Arbetat enskilt

with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

procedure Prog is

    -- Deluppgift 1
    procedure Multiply (Left           : out String;
                        Right, Result  : out Integer) is
    begin
        Put ("Mata in en sträng med exakt 3 tecken: ");
        Get (Left);
        Skip_Line;
        Put ("Mata in ett heltal: ");
        Get (Right);
        Skip_Line;
        Result := Integer (Float'Rounding (Float'Value (Left) * Float (Right))); 
        -- Antar att detta avses när svaret ska avrundas enligt uppgiften
    end Multiply;

    -- Deluppgift 2
    function "*" (Left  : in Float;
                  Right : in String) return Integer is
    begin
        return Integer (Float'Floor (Left * Float'Value (Right)));
    end "*";

    -- Deluppgift 3
    function Add32_7 (Value : in Float) return Integer is
    begin
        return Integer (Value + 32.7);
    end Add32_7;

    Str         : String (1 .. 3);
    Int, Result : Integer;
    Float1      : Float;
begin
    Multiply (Str, Int, Result);
    Put ("Du matade in strängen: " & Str);
    Put (" och heltalet: ");
    Put (Int, Width => 0);
    Put (" och produkten blev ");
    Put (Result);
    New_Line (2);

    Put ("Mata in ett flyttal: ");
    Get (Float1);
    Skip_Line;
    Put ("Mata in en sträng: ");
    Get (Str);
    Skip_Line;
    Put ("Den beräknade produkten av ");
    Put (Float1, Fore => 0, Aft => 1, Exp => 0);
    Put (" och " & Str & " blir ");
    Put (Float1 * Str, Width => 0);
    New_Line (2);

    Put ("Mata in ett flyttal: ");
    Get (Float1);
    Skip_Line;
    Put ("summan av ");
    Put (Float1, Fore => 0, Aft => 1, Exp => 0);
    Put (" och 32.7 blir ");
    Put (Add32_7 (Float1), Width => 0);
    New_Line;
end Prog;
