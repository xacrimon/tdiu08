with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
use Ada.Text_IO;
use Ada.Integer_Text_IO;
use Ada.Float_Text_IO;

procedure Hemlig is
    CurrentPrice : Float;
    FirstPrice : Float;
    LastPrice : Float;
    Step : Float;
    VATPercentage : Float;
begin
    --Put("Första pris: ");
    --Get(FirstPrice);
    --Skip_Line;
--
    --Put("Sista pris: ");
    --Get(LastPrice);
    --Skip_Line;
--
    --Put("Steg: ");
    --Get(Step);
    --Skip_Line;
--
    --Put("Momsprocent: ");
    --Get(VATPercentage);
    --Skip_Line;

    FirstPrice := 7.5;
    LastPrice := 12.0;
    Step := 0.5;
    VATPercentage := 10.0;

    New_Line;
    Put_Line("============ Momstabell ============");
    Put_Line("Pris utan moms  Moms   Pris med moms");
    CurrentPrice := FirstPrice;
    while CurrentPrice <= LastPrice loop
        Put(CurrentPrice, Fore => 6, Aft => 2, Exp => 0);
        Put(CurrentPrice * 0.01 * VATPercentage, Fore => 8, Aft => 2, Exp => 0);
        Put(CurrentPrice + CurrentPrice * 0.01 * VATPercentage, Fore => 9, Aft => 2, Exp => 0);
        New_Line;
        CurrentPrice := CurrentPrice + Step;
    end loop;
end Hemlig;
