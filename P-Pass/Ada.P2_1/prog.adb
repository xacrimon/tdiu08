-- matol699: Arbetat enskilt

with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

procedure Prog is 

    procedure Subtract (Left   : out String;
                        Right  : out Character;
                        Result : out Float) is
    begin
        Put ("Mata in en sträng med exakt 3 tecken: ");
        Get (Left (Left'First .. Left'First + 2));
        Skip_Line;
        Put ("Mata in ett tecken: ");
        Get (Right);
        Skip_Line;
        Result := Float'Ceiling (Float'Value (Left) - Float (Character'Pos (Right) - Character'Pos ('0')));
    end Subtract;

    function "+" (Left : in Float;
                  Right : in String) return Float is
    begin
        return Float'Ceiling (Left + Float'Value (Right));
    end "+";

    function Sub32_7 (Str : in String) return Integer is
    begin
        return Integer (Float'Ceiling (Float'Value (Str) - 32.7));
    end Sub32_7;

    Str    : String (1 .. 3);
    Char   : Character;
    Float1 : Float;

begin
    Subtract (Str, Char, Float1);
    Put ("Du matade in strängen: " & Str & " och tecknet: " & Char & " och differensen blev ");
    Put (Float1);
    New_Line (2);

    Put ("Mata in ett flyttal: ");
    Get (Float1);
    Skip_Line;
    Put ("Mata in en sträng: ");
    Get (Str);
    Skip_Line;
    Put ("Den beräknade summan av ");
    Put (Float1, Fore => 0, Aft => 1, Exp => 0);
    Put (" och " & Str & " blir ");
    Put (Float1 + Str, Fore => 0, Aft => 1, Exp => 0);
    New_Line (2);

    Put ("Mata in en sträng: ");
    Get (Str);
    Skip_Line;
    Put ("differensen mellan " & Str & " och 32.7 blir ");
    Put (Sub32_7 (Str), Width => 0);
    New_Line;
end Prog;