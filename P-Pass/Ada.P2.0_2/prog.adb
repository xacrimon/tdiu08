-- matol699: Arbetat enskilt

with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

procedure Prog is

    procedure Sum (Left, Right, Result : out Float) is
    begin
        Put ("Mata in ett flyttal: ");
        Get (Left);
        Skip_Line;
        Put ("Mata in ett flyttal: ");
        Get (Right);
        Skip_Line;
        Result := Float'Ceiling (Left + Right);
    end Sum;

    function "-" (C : in Character;
                  S : in String) return Integer is
    begin
        return Integer (Float (Character'Pos (C) - Character'Pos ('0')) - Float'Value (S));
    end "-";

    function Square (S : in String) return Integer is
    begin
        return Integer (Float'Value (S) * Float'Value (S));
    end Square;

    Float1, Float2, Result : Float;
    Str                    : String (1 .. 3);
    Char                   : Character;
begin
    Sum (Float1, Float2, Result);
    Put ("Du matade in flyttalet: ");
    Put (Float1, Fore => 0, Aft => 1, Exp => 0);
    Put (" och flyttalet: ");
    Put (Float2, Fore => 0, Aft => 1, Exp => 0);
    Put (" och summan blev ");
    Put (Result);
    New_Line (2);

    Put ("Mata in ett tecken: ");
    Get (Char);
    Skip_Line;
    Put ("Mata in en sträng: ");
    Get (Str);
    Skip_Line;
    Put ("Den beräknade differensen mellan " & Char & " och " & Str & " blir ");
    Put (Char - Str, Width => 0);
    New_Line (2);

    Put ("Mata in längden: ");
    Get (Str);
    Skip_Line;
    Put ("Den beräknade arean blev: ");
    Put (Square (Str), Width => 0);
    New_Line;
end Prog;
