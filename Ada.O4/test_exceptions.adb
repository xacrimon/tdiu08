with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Test_Exceptions is
    -- Length_Error kastas om en inmatad sträng är för kort.
    Length_Error : exception;

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
        Put_Line("1. Felkontrollerad heltalsinläsning");
        Put_Line("2. Längdkontrollerad stränginläsning");
        Put_Line("3. Felkontrollerad datuminläsning");
        Put_Line("4. Avsluta programmet");

        loop
	        Put("Mata in N: ");
	        Get(N);
	        exit when N in 1 .. 4;	 
	        Put_Line("Felaktigt N, mata in igen!");
        end loop;

        return N;
    end Menu_Selection;

    procedure Print_Get_Safe_Lead(Min, Max : in Integer) is
    begin
        Put("Mata in värde (");
        Put(Min, Width => 0);
        Put(" - ");
        Put(Max, Width => 0);
        Put("): ");
    end Print_Get_Safe_Lead;

    procedure Get_Safe(Value : out Integer;
                       Min, Max : in Integer) is
    begin
        loop
            Print_Get_Safe_Lead(Min, Max);

            begin
                Get(Value);

                if Value < Min then
                    Put("För litet värde. ");
                elsif Value > Max then
                    Put("För stort värde. ");
                end if;

                exit when Value in Min .. Max;
            exception
                when DATA_ERROR =>
                    Put("Felakting datatyp. ");
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
        Put("Mata in Min och Max: ");
        Get(Min);
        Get(Max);

        Get_Safe(Value, Min, Max);
        Skip_Line;

        Put("Du matade in heltalet ");
        Put(Value, Width => 0);
        Put_Line(".");      
    end Upg1;

    procedure Get_Correct_String(S : out String) is
        I : Integer := 1;
    begin
        while I <= S'Length loop
            Get_Immediate(S(I));
            Put(S(I));

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
    procedure Upg2(Length : in Integer) is
        S : String(1 .. Length); 
    begin      
        Put("Mata in en sträng med exakt ");
        Put(Length, Width => 0);
        Put(" tecken: ");

        Get_Correct_String(S);
        Skip_Line;

        Put_Line("Du matade in strängen " & S & ".");      
    end Upg2;

    type Date_Type is record
        Day   : Integer range 1 .. 31;
        Month : Integer range 1 .. 12;
        Year  : Integer range 1532 .. 9000;
    end record;

    procedure Get(Date : out Date_Type) is
    begin
        Put("TODO");
    end Get;

    procedure Put(Date : in Date_Type) is
    begin
        Put("TODO");
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
        Put("Mata in ett datum: ");
        Get(Date);
        Skip_Line;

        Put("Du matade in ");
        Put(Date);
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
	        Put("Mata in en stränglängd: ");
	        Get(Length);
	        Skip_Line;

	        Upg2(Length);
        elsif Choice = 3 then
	        Upg3;
        else
	        Put_Line("Programmet avslutas.");
	        exit;
        end if;      
    end loop;

    exception
        when Length_Error =>
            Put_Line("För få inmatade tecken!");
end Test_Exceptions;
