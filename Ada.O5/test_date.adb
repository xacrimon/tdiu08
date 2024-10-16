with Ada.Text_IO; use Ada.Text_IO;

with Date; use Date;

procedure Test_Date is
   
   Date_1, Date_2: Date_Type;
begin
   
   Put("Mata in datum 1: ");
   Get(Date_1);
   Skip_Line;
   
   Put("Datumet var: ");
   Put(Date_1);
   New_Line;
   
   Put("Nästa dag: ");
   Put(Next_Date(Date_1));
   New_Line;
   
   Put("Föregående dag: ");
   Put(Previous_Date(Date_1));
   New_Line;
   
   Put("Mata in Datum 2: ");
   Get(Date_2);
   Skip_Line;
   
   Put("Datum 1 > Datum 2? ");
   if Date_1 > Date_2 then
      Put_Line("Ja.");
   else
      Put_Line("Nej.");
   end if;
   
   Put("Datum 1 < Datum 2? ");
   if Date_1 < Date_2 then
      Put_Line("Ja.");
   else
      Put_Line("Nej.");
   end if;
   
   Put("Datum 1 = Datum 2? ");
   if Date_1 = Date_2 then
      Put_Line("Ja.");
   else
      Put_Line("Nej.");
   end if;
   
exception
   when Format_Error =>
      Put("Felaktigt format.");
   when Year_Error =>
      Put("Felaktigt år.");
   when Month_Error =>
      Put("Felaktig månad.");
   when Day_Error =>
      Put("Felaktig dag.");
end Test_Date;
