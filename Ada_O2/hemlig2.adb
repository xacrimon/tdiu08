-- matol699: Samarbetat med joewe275, Joel Wejdenstål, samma program 

with Ada.Text_IO;       use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Hemlig is
    Current_Price : Float;
    First_Price : Float;
    Last_Price : Float;
    Step : Float;
    VAT_Percentage : Float;
    Error : String := "Felaktigt värde!";
    Last_Index : Integer;
begin
    loop 
        Put("Första pris: ");
        Get(First_Price);
        Skip_Line;

        exit when First_Price >= 0.0;
        
        Put_Line(Error);
    end loop;

    loop 
        Put("Sista pris: ");
        Get(Last_Price);
        Skip_Line;

        exit when Last_Price >= First_Price;

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
        Get(VAT_Percentage);
        Skip_Line;

        exit when VAT_Percentage >= 0.0 and VAT_Percentage <= 100.0;

        Put_Line(Error);
    end loop;

    New_Line;
    Put_Line("============ Momstabell ============");
    Put_Line("Pris utan moms  Moms   Pris med moms");

    Last_Index := Integer(Float'Floor((Last_Price - First_Price) / Step));

    for i in 0 .. Last_Index loop
        Current_Price := First_Price + Float(i) * Step;
        Put(Current_Price, Fore => 6, Aft => 2, Exp => 0);
        Put(Current_Price * 0.01 * VAT_Percentage, Fore => 8, Aft => 2, Exp => 0);
        Put(Current_Price + Current_Price * 0.01 * VAT_Percentage, Fore => 9, Aft => 2, Exp => 0);
        New_Line;
    end loop;

end Hemlig;
