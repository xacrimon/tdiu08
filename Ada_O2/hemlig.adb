-- joewe275: Samarbetat med matol699, Mattis Olevall, samma program

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
begin
    loop 
        Put("Första pris: ");
        Get(FirstPrice);
        Skip_Line;

        if FirstPrice < 0.0 then
            Put_Line("Felaktigt värde!");
        else
            exit;
        end if;
    end loop;

    loop 
        Put("Sista pris: ");
        Get(LastPrice);
        Skip_Line;

        if LastPrice < FirstPrice then
            Put_Line("Felaktigt värde!");
        else
            exit;
        end if;
    end loop;

    loop 
        Put("Steg: ");
        Get(Step);
        Skip_Line;

        if Step < 0.0 then
            Put_Line("Felaktigt värde!");
        else
            exit;
        end if;
    end loop;

    Put("Momsprocent: ");
    Get(VATPercentage);
    Skip_Line;

    New_Line;
    Put_Line("============ Momstabell ============");
    Put_Line("Pris utan moms  Moms   Pris med moms");
    CurrentPrice := FirstPrice;
    while CurrentPrice <= LastPrice+0.01 loop
        Put(CurrentPrice, Fore => 6, Aft => 2, Exp => 0);
        Put(CurrentPrice * 0.01 * VATPercentage, Fore => 8, Aft => 2, Exp => 0);
        Put(CurrentPrice + CurrentPrice * 0.01 * VATPercentage, Fore => 9, Aft => 2, Exp => 0);
        New_Line;
        CurrentPrice := CurrentPrice + Step;
    end loop;
end Hemlig;
