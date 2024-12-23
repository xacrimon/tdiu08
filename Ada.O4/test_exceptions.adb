-- joewe275: Samarbetat med matol699, Mattis Olevall, samma program
-- matol699: Samarbetat med joewe275, Joel Wejdenstål, samma program

with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Test_Exceptions is
    -- Length_Error kastas om en inmatad sträng är för kort.
    Length_Error : exception;

    -- Format_Error kastas om ett inmatat datum är i fel format.
    Format_Error : exception;

    -- Year_Error kastas om ett inmatat år är utanför intervallet 1532-9000.
    Year_Error : exception;

    -- Month_Error kastas om en inmatad månad är utanför intervallet 1-12.
    Month_Error : exception;

    -- Day_Error kastas om en inmatad dag inte är giltig för den givna månaden.
    Day_Error : exception;

    -- Date_Type är en recordtyp som innehåller tre heltal för dag, månad och år.
    type Date_Type is record
        Day   : Integer;
        Month : Integer;
        Year  : Integer;
    end record;

    ----------------------------------------------------------------------
    -- Underprogram för att skriva ut meny och hantera menyval          --
    --                                                                  --
    -- Underprogrammet skriver ut de menyval som finns tillgängliga.    --
    -- Användaren får mata in menyval tills denne matat in ett          --
    -- korrekt menyval.                                                 --
    ----------------------------------------------------------------------
    function Menu_Selection return Integer is
        N : Integer;
    begin
        Put_Line ("1. Felkontrollerad heltalsinläsning");
        Put_Line ("2. Längdkontrollerad stränginläsning");
        Put_Line ("3. Felkontrollerad datuminläsning");
        Put_Line ("4. Avsluta programmet");

        loop
            Put ("Mata in N: ");
            Get (N);
            Skip_Line;
            exit when N in 1 .. 4;
            Put_Line ("Felaktigt N, mata in igen!");
        end loop;

        return N;
    end Menu_Selection;

    -- Print_Get_Safe_Lead skriver ut ledtexten för Get_Safe.
    procedure Print_Get_Safe_Lead (Min, Max : in Integer) is
    begin
        Put ("Mata in värde (");
        Put (Min, Width => 0);
        Put (" - ");
        Put (Max, Width => 0);
        Put ("): ");
    end Print_Get_Safe_Lead;

    -- Get_Safe läser in ett heltal med ett visst antal tecken. Försöker igen om inmatningen är felaktig.
    procedure Get_Safe (Value    :    out Integer;
                        Min, Max : in     Integer) is
    begin
        loop
            Print_Get_Safe_Lead (Min, Max);

            begin
                Get (Value);

                if Value < Min then
                    Put ("För litet värde. ");
                elsif Value > Max then
                    Put ("För stort värde. ");
                end if;

                exit when Value in Min .. Max;
            exception
                when DATA_ERROR =>
                    Put ("Fel datatyp. ");
                    Skip_Line;
            end;
        end loop;
    end Get_Safe;

    ----------------------------------------------------------------------
    -- Underprogram för menyval 1: "felhantering av heltalsinmatning"   --
    --                                                                  --
    -- Underprogrammet låter användaren mata in ett intervall angivet   --
    -- med två heltal Min och Max. Get_Safe anropas                     --
    -- sedan med detta intervall och sköter felhanteringen av           --
    -- heltalsinläsningen där användaren får mata in värden tills       --
    -- korrekt värde matas in.                                          --
    ----------------------------------------------------------------------
    procedure Upg1 is
        Value, Min, Max : Integer;
    begin
        Put ("Mata in Min och Max: ");
        Get (Min);
        Get (Max);

        Get_Safe (Value, Min, Max);
        Skip_Line;

        Put ("Du matade in heltalet ");
        Put (Value, Width => 0);
        Put_Line (".");
    end Upg1;

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

    ----------------------------------------------------------------------
    -- Underprogram för menyval 2: "felhantering av stränginmatning"    --
    --                                                                  --
    -- Underprogrammet skapar en sträng som är lika lång som parametern --
    -- Length. Underprogrammet skickar denna sträng till                --
    -- Get_Correct_String där felhanteringen av stränginmatningen sker. --
    -- Om användaren matar in en för kort sträng kommer                 --
    -- Get_Correct_String kasta/resa undantag vilket inte ska           --
    -- fångas här utan i huvudprogrammet.                               --
    ----------------------------------------------------------------------
    procedure Upg2 (Length : in Integer) is
        S : String (1 .. Length);
    begin
        Put ("Mata in en sträng med exakt ");
        Put (Length, Width => 0);
        Put (" tecken: ");

        Get_Correct_String (S);
        Skip_Line;

        Put_Line ("Du matade in strängen " & S & ".");
    end Upg2;

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

    ----------------------------------------------------------------------
    -- Underprogram för menyval 3: "felhantering av datuminmatning"     --
    --                                                                  --
    -- Underprogrammet anropar Get som i sin tur kommer läsa in och     --
    -- kontrollera ett datums format och rimlighet. Om datumet är       --
    -- felaktigt kommer Get kasta/resa undantag vilket detta            --
    -- underprogram ska fånga, skriva ut felmeddelande för och sedan    --
    -- anropa Get igen.                                                 --
    ----------------------------------------------------------------------
    procedure Upg3 is
        Date : Date_Type;
    begin
        loop
            begin
                Put ("Mata in ett datum: ");
                Get (Date);
                Skip_Line;
                exit;
            exception
                when Format_Error =>
                    Put ("Felaktigt format! ");
                when Year_Error   =>
                    Put ("Felaktigt år! ");
                when Month_Error  =>
                    Put ("Felaktig månad! ");
                when Day_Error    =>
                    Put ("Felaktig dag! ");
            end;
        end loop;

        Put ("Du matade in ");
        Put (Date);
        New_Line;
    end Upg3;

    ----------------------------------------------------------------------
    -- Huvudprogram                                                     --
    --                                                                  --
    -- Huvudprogrammet skriver ut och låter användaren välja val i en   --
    -- meny via underprogrammet Menu_Selection. Beroende på vilket      --
    -- menyval användaren valt kommer olika underprogram anropas.       --
    -- Observera att för menyval 2 kommer användaren få mata in längden --
    -- av en sträng vilket skickas vidare till underporgrammet Upg2 där --
    -- strängen i sig skapas.                                           --
    ----------------------------------------------------------------------
    Choice, Length : Integer;

begin
    loop
        Choice := Menu_Selection;

        if Choice = 1 then
            Upg1;
        elsif Choice = 2 then
            Put ("Mata in en stränglängd: ");
            Get (Length);
            Skip_Line;

            Upg2 (Length);
        elsif Choice = 3 then
            Upg3;
        else
            Put_Line ("Programmet avslutas.");
            exit;
        end if;
    end loop;

exception
    when Length_Error =>
        Put_Line ("För få inmatade tecken!");
end Test_Exceptions;
