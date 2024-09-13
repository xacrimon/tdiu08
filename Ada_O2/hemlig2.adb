-- joewe275: Samarbetat med matol699, Mattis Olevall, samma program
-- matol699: Samarbetat med joewe275, Joel Wejdenstål, samma program 
with Ada.Text_IO;
with Ada.Float_Text_IO;
use Ada.Text_IO;
use Ada.Float_Text_IO;
procedure Hemlig is
    CurrentPrice : Float;
    FirstPrice : Float;
    LastPrice : Float;
    Step : Float;
    VATPercentage : Float;
    Error : String := "Felaktigt värde!";
begin
    loop 
        Put("Första pris: ");
        Get(FirstPrice);
        Skip_Line;
        exit when FirstPrice > 0.0;
        Put_Line(Error);
    end loop;

    loop 
        Put("Sista pris: ");
        Get(LastPrice);
        Skip_Line;
        exit when LastPrice > FirstPrice;
        Put_Line(Error);
    end loop;

    loop 
        Put("Steg: ");
        Get(Step);
        Skip_Line;
        exit when Step > 0.0;
        Put_Line(Error);
    end loop;

    loop 
        Put("Momsprocent: ");
        Get(VATPercentage);
        Skip_Line;
        exit when VATPercentage > 0.0 or VATPercentage < 100.0;
        Put_Line(Error);
    end loop;

    New_Line;
    Put_Line("============ Momstabell ============");
    Put_Line("Pris utan moms  Moms   Pris med moms");
    CurrentPrice := FirstPrice;
    while CurrentPrice <= LastPrice + 0.01 loop
        Put(CurrentPrice, Fore => 6, Aft => 2, Exp => 0);
        Put(CurrentPrice * 0.01 * VATPercentage, Fore => 8, Aft => 2, Exp => 0);
        Put(CurrentPrice + CurrentPrice * 0.01 * VATPercentage, Fore => 9, Aft => 2, Exp => 0);
        New_Line;
        CurrentPrice := CurrentPrice + Step;
    end loop;
end Hemlig;
