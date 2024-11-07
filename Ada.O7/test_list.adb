with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

with Sorted_List; use Sorted_List;

procedure Test_List is
   Value: Integer;
   List: List_Type;
begin
   Put ("Mata in heltal. Avsluta med -1: ");
   loop
      Get(Value);
      exit when Value = -1;
      Insert(List, Value);
   end loop;
   Skip_Line;
   
   Put("Listan innehåller nu elementen");
   Put(List);
   New_Line;

   Put("Listan är ");
   if not Empty(List) then
      Put("inte ");
   end if;
   Put_Line("tom.");
   
   Put("Mata in ett värde: ");
   Get(Value);
   Skip_Line;
   Put("Listan innehåller ");
   if not Member(List, Value) then
      Put("inte ");
   end if;
   Put("värdet ");
   Put(Value, Width => 0);
   Put_Line(".");
   
   Put("Mata in ett till värde: ");
   Get(Value);
   Skip_Line;
   Put("Listan innehåller ");
   if not Member(List, Value) then
      Put("inte ");
   end if;
   Put("värdet ");
   Put(Value, Width => 0);
   Put_Line(".");
   
   Put("Mata in ett värde att ta bort: ");
   Get(Value);
   Skip_Line;
   Remove(List, Value);
   Put("Listan innehåller elementen");
   Put(List);
   New_Line;
   
   Put("Listan innehåller nu ");
   Put(Length(List), Width => 0);
   Put_Line(" element.");
   
   Put_Line("Rensar listan.");
   Delete(List);
   
   Put("Listan innehåller elementen");
   Put(List);
   New_Line;
   
   Put("Listan innehåller nu ");
   Put(Length(List), Width => 0);
   Put_Line(" element.");
   
exception
   when No_Such_Element_Error =>
      Put("Felaktigt element angivet, programmet avslutas.");   
end Test_List;
