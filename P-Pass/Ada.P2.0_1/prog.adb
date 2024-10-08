-- matol699: Arbetat enskilt

with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Prog is

    function Triangle (S : in String) return Float is
        Side : Float;
    begin
        Side := Float'Value (S);
        return Side * (Side * Sqrt (3.0) / 2.0) / 2.0;
    end Triangle;

    function Sum (C : in Character; S : in String) return Float is
    begin
        return Float'Value ((1 => C)) + Float'Value (S);
    end Sum;

    procedure Multiply (C : out Character; F : out Float; Result : out Float)
    is
    begin
        Put ("Mata in ett tecken: ");
        Get (C);
        Skip_Line;

        Put ("Mata in ett flyttal: ");
        Get (F);
        Skip_Line;

        Result := Float'Value ((1 => C)) * F;
        Result := Float'Floor (Result);
    end Multiply;

    S         : String (1 .. 3);
    C         : Character;
    F, Result : Float;

begin
    Put ("Mata in längden: ");
    Get (S);
    Skip_Line;

    Put ("Den beräknade arean blev: ");
    Put (Triangle (S), Fore => 0, Aft => 1, Exp => 0);
    New_Line (2);

    Put ("Mata in ett tecken: ");
    Get (C);
    Skip_Line;

    Put ("Mata in en sträng: ");
    Get (S);
    Skip_Line;

    Put ("Den beräknade summan av " & C & " och " & S & " blir ");
    Put (Sum (C, S), Fore => 0, Aft => 1, Exp => 0);
    New_Line (2);

    Multiply (C, F, Result);
    Put ("Du matade in tecknet: " & C);
    Put (" och flyttalet: ");
    Put (F, Fore => 0, Aft => 1, Exp => 0);
    Put (" och produkten blev ");
    Put (Result);
    New_Line;
end Prog;
