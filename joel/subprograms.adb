-- joewe275: Arbetat enskilt

with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;

procedure Subprograms is
    -- Deluppgift 1.
    -- Notering för assistent: Left-hand-side och Right-hand-side av operatorn.
    function "*" (Lhs : in Character;
                  Rhs : in Float) return Float is
        Lhs_Value : Float := Float(Character'Pos(Lhs) - Character'Pos('0'));
    begin
        return Float'Rounding(Lhs_Value * Rhs);
    end "*";

    -- Deluppgift 2.
    function Max_Of(A, B : in Float) return Float is
    begin
        if A > B then
            return A;
        else
            return B;
        end if;
    end Max_Of;

    -- Deluppgift 3.
    procedure Parse_Int(Input : in String;
                        Output : out Integer) is
        Raw_Value : Float := Float'Value(Input);
    begin
        Output := Integer(Float'Floor(Raw_Value));
    end Parse_Int;

    -- Variabler för deluppgift 1.
    Product_Lhs : Character;
    Product_Rhs : Float;

    -- Variabler för deluppgift 2.
    Max_A, Max_B : Float;

    -- Variabler för deluppgift 3.
    ToConvert : String (1 .. 3);
    Parsed_Int : Integer;
begin
    -- Deluppgift 1 inläsning.
    Put("Mata in ett tecken: ");
    Get(Product_Lhs);
    Put("Mata in ett flyttal: ");
    Get(Product_Rhs);
    Skip_Line;

    -- Deluppgift 1 utmatning.
    Put("Den beräknade produkten av ");
    Put(Product_Lhs);
    Put(" och ");
    Put(Product_Rhs, Fore => 0, Aft => 1, Exp => 0);
    Put(" blir ");
    Put(Product_Lhs * Product_Rhs, Fore => 0, Aft => 1, Exp => 0);
    New_Line(2);

    -- Deluppgift 2 inläsning.
    Put("Mata in två flyttal: ");
    Get(Max_A);
    Get(Max_B);
    Skip_Line;

    -- Deluppgift 2 utmatning.
    Put("Det största värdet av dessa är: ");
    Put(Max_Of(Max_A, Max_B), Fore => 0, Aft => 1, Exp => 0);
    New_Line(2);

    -- Deluppgift 3 inläsning.
    Put("Mata in en sträng: ");
    Get(ToConvert);
    Skip_Line;

    -- Deluppgift 3 beräkning och utmatning.
    Parse_Int(ToConvert, Parsed_Int);
    Put("Om man omvandlar strängen: " & ToConvert & " till ett heltal blir det: ");
    Put(Parsed_Int, Width => 0);
    New_Line;
end Subprograms;
