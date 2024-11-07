with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body Date is
    -- Get_Correct_String läser in en sträng med ett visst antal tecken och kastar Length_Error
    -- om den stöter på en ny rad innan strängen är fylld.
    procedure Get_Correct_String (S : out String) is
    begin
        loop
            Get (S (S'First));
            exit when S (S'First) /= ' ';

            if End_Of_Line then
                Skip_Line;
            end if;
        end loop;

        for I in S'First + 1 .. S'Length loop
            if End_Of_Line then
                raise Length_Error;
            end if;

            Get(S (I));
        end loop;
    end Get_Correct_String;

     function Parse_Date_Field (Field : in String) return Integer is
    begin
        for I in Field'Range loop
            if not (Field (I) in '0' .. '9') then
                raise Format_Error;
            end if;
        end loop;

        return Integer'Value (Field);
    end Parse_Date_Field;

    -- Parse_Date tyder datumsträng på formatet YYYY-MM-DD och lagrar heltalen i en Date_Type.
    procedure Parse_Date (Item :    out Date_Type; 
                          S    : in     String) is
    begin
        if S (S'First + 4) /= '-' or S (S'First + 7) /= '-' then
            raise Format_Error;
        end if;

        Item.Year  := Parse_Date_Field (S (S'First .. S'First + 3));
        Item.Month := Parse_Date_Field (S (S'First + 5 .. S'First + 6));
        Item.Day   := Parse_Date_Field (S (S'First + 8 .. S'First + 9));
    end Parse_Date;

    -- Days_In_Month returnerar antalet dagar i en given månad ett visst år.
    function Days_In_Month (Month, Year : in Integer) return Integer is
        Days     : constant array (1 .. 12) of Integer := (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
        February : constant Integer := 2;
    begin
        if Month = February and ((Year mod 4 = 0 and Year mod 100 /= 0) or Year mod 400 = 0)
        then
            return Days (February) + 1;
        else
            return Days (Month);
        end if;
    end Days_In_Month;

    -- Validate_Date kontrollerar att ett datum är giltigt enligt uppgiftskrav.
    -- Är det inte det kastas en av Year_Error, Month_Error eller Day_Error.
    procedure Validate_Date (Item : in Date_Type) is
    begin
        if Item.Year < 1_532 or Item.Year > 9_000 then
            raise Year_Error;
        end if;

        if Item.Month < 1 or Item.Month > 12 then
            raise Month_Error;
        end if;

        if Item.Day < 1 or Item.Day > Days_In_Month (Item.Month, Item.Year)
        then
            raise Day_Error;
        end if;
    end Validate_Date;

    -- Zero_Pad konverterar ett heltal till en sträng och fyller på med ledande nollor till en viss längd.
    function Zero_Pad (Value, Length : in Integer) return String is
        Data      : String (1 .. Length);
        Max_Index : Integer;
    begin
        Max_Index := Length - Integer'Image (Value)'Length + 1;
        for i in 1 .. Max_Index loop
            Data (i) := '0';
        end loop;

        Data :=
           Data (1 .. Max_Index) &
           Integer'Image (Value) (2 .. Integer'Image (Value)'Length);
        return Data;
    end Zero_Pad;

    -- Get läser in ett datum på formatet YYYY-MM-DD från standard input.
    procedure Get (Item : out Date_Type) is
        Date_String : String (1 .. 10);
    begin
        begin
            Get_Correct_String (Date_String);
            Parse_Date (Item, Date_String);
            Validate_Date (Item);
        exception
            when Length_Error | Constraint_Error =>
                raise Format_Error;
        end;
    end Get;

    -- Put skriver ut ett datum på formatet YYYY-MM-DD till standard output.
    procedure Put (Item : in Date_Type) is
    begin
        Put (Zero_Pad (Item.Year, 4));
        Put ("-");
        Put (Zero_Pad (Item.Month, 2));
        Put ("-");
        Put (Zero_Pad (Item.Day, 2));
    end Put;

    function Next_Date (Item : in Date_Type) return Date_Type is
        Date : Date_Type := Item;
    begin
        Date.Day := Date.Day + 1;
        if Date.Day > Days_In_Month (Date.Month, Date.Year) then
            Date.Day := 1;
            Date.Month := Date.Month + 1;

            if Date.Month > 12 then
                Date.Month := 0;
                Date.Year := Date.Year + 1;
                Validate_Date (Date);
            end if;
        end if;

        return Date;
    end Next_Date;

    function Previous_Date (Item : in Date_Type) return Date_Type is
        Date : Date_Type := Item;
    begin
        Date.Day := Date.Day - 1;
        if Date.Day < 1 then
            Date.Day := Days_In_Month (Date.Month, Date.Year);
            Date.Month := Date.Month - 1;

            if Date.Month < 1 then
                Date.Month := 12;
                Date.Year := Date.Year - 1;
                Validate_Date (Date);
            end if;
        end if;

        return Date;
    end Previous_Date;

    function "<" (Left, Right : in Date_Type) return Boolean is
    begin
        if Left.Year < Right.Year then
            return True;
        elsif Left.Year > Right.Year then
            return False;
        end if;

        if Left.Month < Right.Month then
            return True;
        elsif Left.Month > Right.Month then
            return False;
        end if;

        if Left.Day < Right.Day then
            return True;
        elsif Left.Day > Right.Day then
            return False;
        end if;

        return False;
    end "<";

    function "=" (Left, Right : in Date_Type) return Boolean is
    begin
        if Left.Year = Right.Year and Left.Month = Right.Month and Left.Day = Right.Day then
            return True;
        else
            return False;
        end if;

    end "=";
    
    function ">" (Left, Right : in Date_Type) return Boolean is
    begin
        if Left.Year > Right.Year then
            return True;
        elsif Left.Year < Right.Year then
            return False;
        end if;

        if Left.Month > Right.Month then
            return True;
        elsif Left.Month < Right.Month then
            return False;
        end if;

        if Left.Day > Right.Day then
            return True;
        elsif Left.Day < Right.Day then
            return False;
        end if;

        return False;
    end ">";
    
end Date;
