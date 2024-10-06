with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Fixed;   use Ada.Strings.Fixed;

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

    procedure Print_Get_Safe_Lead (Min, Max : in Integer) is
    begin
        Put ("Mata in värde (");
        Put (Min, Width => 0);
        Put (" - ");
        Put (Max, Width => 0);
        Put ("): ");
    end Print_Get_Safe_Lead;

    procedure Get_Safe (Value : out Integer;
                        Min, Max : in Integer) is
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
                    Put ("Felakting datatyp. ");
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

    procedure Get_Correct_String (S : out String) is
        I : Integer := 1;
    begin
        while I <= S'Length loop
            Get_Immediate (S(I));
            Put (S(I));

            if not (I = 1 and (S(I) = ' ' or S(I) = ASCII.LF)) then
                if S(I) = ASCII.LF then
                    raise Length_Error;
                end if;

                I := I + 1;
            end if;
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
        S : String(1 .. Length); 
    begin      
        Put ("Mata in en sträng med exakt ");
        Put (Length, Width => 0);
        Put (" tecken: ");

        Get_Correct_String (S);
        Skip_Line;

        Put_Line ("Du matade in strängen " & S & ".");      
    end Upg2;

    type Date_Type is record
        Day, Month, Year : Integer;
    end record;

    procedure Parse_Date (Item : out Date_Type; S : in String) is
    begin
        Item.Year := Integer'Value(S(S'First .. S'First + 3));
        Item.Month := Integer'Value(S(S'First + 5 .. S'First + 6));
        Item.Day := Integer'Value(S(S'First + 8 .. S'First + 9));
    end Parse_Date;

    function Days_In_Month (Month, Year : in Integer) return Integer is
        Days : constant array(1 .. 12) of Integer := (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
        February : constant Integer := 2;
    begin
        if Month = February and ((Year mod 4 = 0 and Year mod 100 /= 0) or Year mod 400 = 0) then
            return Days(February) + 1;
        else
            return Days(Month);
        end if;
    end Days_In_Month;

    procedure Validate_Date (Item : in Date_Type) is
    begin
        if Item.Year < 1532 or Item.Year > 9000 then
            raise Year_Error;
        end if;

        if Item.Month < 1 or Item.Month > 12 then
            raise Month_Error;
        end if;

        if Item.Day < 1 or Item.Day > Days_In_Month (Item.Month, Item.Year) then
            raise Day_Error;
        end if;
    end Validate_Date;

    function Zero_Pad (Value, Length : in Integer) return String is
        Data : String := Integer'Image (Value);
    begin
        return Tail (Data(2 .. Data'Last), Length, '0');
    end Zero_Pad;

    procedure Get (Item : out Date_Type) is
        Date_String : String(1 .. 10);
    begin
        begin
            Get_Correct_String (Date_String);
            Skip_Line;
            Parse_Date (Item, Date_String);
            Validate_Date (Item);
        exception
            when Length_Error | Constraint_Error =>
                raise Format_Error;
        end;
    end Get;

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
                exit;
            exception
                when Format_Error =>
                    Put ("Felaktigt format! ");
                when Year_Error =>
                    Put ("Felaktigt år! ");
                when Month_Error =>
                    Put ("Felaktig månad! ");
                when Day_Error =>
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
