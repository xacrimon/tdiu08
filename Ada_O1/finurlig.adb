-- joewe275: Samarbetat med matol699, Mattis Olevall, samma program

with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
use Ada.Text_IO;
use Ada.Integer_Text_IO;
use Ada.Float_Text_IO;

procedure Finurlig is
    StrInput : String(1..5);
    IntInput : Integer;
    FloatInput : Float;
    CharInput : Character;
begin
    Put("Skriv in ett heltal: ");
    Get(IntInput);
    Put_Line("Du skrev in talet:" & Integer'Image(IntInput));
    New_Line;
    Skip_Line;

    -- 1
    Put("Skriv in fem heltal: ");
    Get(IntInput);
    Put("Du skrev in talen: ");
    Put(IntInput, Width => 0);
    Put(" ");

    -- 2..5
    Get(IntInput);
    Put(IntInput, Width => 0);
    Put(" ");
    Get(IntInput);
    Put(IntInput, Width => 0);
    Put(" ");
    Get(IntInput);
    Put(IntInput, Width => 0);
    Put(" ");
    Get(IntInput);
    Put(IntInput, Width => 0);
    New_Line(2);
    Skip_Line;

    Put("Skriv in ett flyttal: ");
    Get(FloatInput);
    Put("Du skrev in flyttalet: ");
    Put(FloatInput, Aft => 3, Exp => 0);
    New_Line(2);
    Skip_Line;

    Put("Skriv in ett heltal och ett flyttal: ");
    Get(IntInput);
    Put("Du skrev in heltalet: ");
    Put(IntInput, Width => 9);
    New_Line;
    Get(FloatInput);
    Put("Du skrev in flyttalet: ");
    Put(FloatInput, Fore => 3, Aft => 4, Exp => 0);
    New_Line(2);
    Skip_Line;

    Put("Skriv in ett tecken: ");
    Get(CharInput);
    Put("Du skrev in tecknet: ");
    Put(CharInput);
    New_Line(2);
    Skip_Line;

    Put("Skriv in en sträng med 5 tecken: ");
    IntInput := 1;
    Get_Line(StrInput, IntInput);
    Put("Du skrev in strängen: ");
    Put(StrInput(1..5));
    New_Line(2);
    Skip_Line;

    Put("Skriv in en sträng med 3 tecken: ");
    IntInput := 1;
    Get_Line(StrInput, IntInput);
    Put("Du skrev in strängen: ");
    Put(StrInput(1..3));
    New_Line(2);
    -- Skip_Line; why?

    Put("Skriv in ett heltal och en sträng med 5 tecken: ");
    Get(IntInput);
    Get(CharInput);
    Put("Du skrev in talet |");
    Put(IntInput, Width => 0);
    IntInput := 1;
    Get_Line(StrInput, IntInput);
    Put("| och strängen |");
    Put(StrInput);
    Put("|.");
    New_Line(2);
    Skip_Line;

    Put("Skriv in en sträng med 3 tecken och ett flyttal: ");
    Get(StrInput(1..3));
    Get(FloatInput);
    Put("Du skrev in """);
    Put(FloatInput, Fore => 0, Aft => 3, Exp => 0);
    Put(""" och "" ");
    Put(StrInput(1..3));
    Put(""".");
    New_Line(2);
    Skip_Line;

    Put("Skriv in en sträng som är maximalt 5 tecken: ");
    IntInput := 1;
    Get_Line(StrInput, IntInput);
    Put("Du skrev in strängen: ");
    Put(StrInput(1..IntInput));
    New_Line(2);

    Put("Skriv in en sträng som är maximalt 5 tecken: ");
    IntInput := 1;
    Get_Line(StrInput, IntInput);
    Put("Du skrev in strängen: ");
    Put(StrInput(1..IntInput));
end Finurlig;
