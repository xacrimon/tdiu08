-- joewe275: Samarbetat med matol699, Mattis Olevall, samma program
-- matol699: Samarbetat med joewe275, Joel Wejdenstål, samma program

with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Float_Text_IO;     use Ada.Float_Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;

procedure Array_Handling is
    Get_Preprint : constant String := "Mata in datamängd: ";
    Put_Preprint : constant String := "Inmatad datamängd: ";

    type DS1 is
        array (31..35) of Float;

    type DS2_U is
        array (Character'Pos('5')..Character'Pos('9')) of String (1..5);
    
    type DS2 is
        array (False..True) of DS2_U;

    type DS3 is
        array (Character'Pos('4')..Character'Pos('8'), 73..74) of Integer;

    procedure Eat_Separator is
        Scratch : Character;
    begin
        Get (Scratch);
    end Eat_Separator;

    procedure Write_Separator is
    begin
        Put (" ");
    end Write_Separator;
    
    procedure Get (Data : out DS1) is
    begin
        for i in Data'Range loop
            Get (Data(i));
            if i /= Data'Last then 
                Eat_Separator;
            end if;
        end loop;
    end Get;

    procedure Put (Data : in DS1) is
    begin
        for i in Data'Range loop
            Put (Data(i), Fore => 0, Aft => 3, Exp => 0);
            if i /= Data'Last then 
                Write_Separator;
            end if;
        end loop;
    end Put;

    procedure Get (Data : out DS2_U) is
    begin
        for i in Data'Range loop
            Get (Data(i));
            if i /= Data'Last then 
                Eat_Separator;
            end if;
        end loop;
    end Get;

    procedure Put (Data : in DS2_U) is
    begin
        for i in Data'Range loop
            Put (Data(i));
            if i /= Data'Last then 
                Write_Separator;
            end if;
        end loop;
    end Put;

    procedure Get (Data : out DS2) is
    begin
        for i in Data'Range loop
            Get (Data(i));
            if i /= Data'Last then 
                Eat_Separator;
            end if;
        end loop;
    end Get;

    procedure Put (Data : in DS2) is
    begin
        for i in Data'Range loop
            Put (Data(i));
            if i /= Data'Last then 
                Write_Separator;
            end if;
        end loop;
    end Put;

    procedure Get (Data : out DS3) is
    begin
        for j in Data'Range (2) loop
            for i in Data'Range (1) loop
                Get (Data(i, j));
                if not (i = Data'Last (1) and j = Data'Last (2)) then 
                    Eat_Separator;
                end if;
            end loop;
        end loop;
    end Get;

    procedure Put (Data : in DS3) is
    begin
        for j in Data'Range (2) loop
            for i in Data'Range (1) loop
                Put (Data(i, j), Width => 0);
                if not (i = Data'Last (1) and j = Data'Last (2)) then 
                    Write_Separator;
                end if;
            end loop;
        end loop;
    end Put;

    Data_One   : DS1;
    Data_Two   : DS2;
    Data_Three : DS3;
begin
    Put_Line("För DS1:");
    Put (Get_Preprint);
    Get (Data_One);
    Skip_Line;

    Put (Put_Preprint);
    Put (Data_One);
    New_Line(2);

    Put_Line("För DS2:");
    Put (Get_Preprint);
    Get (Data_Two);
    Skip_Line;

    Put (Put_Preprint);
    Put (Data_Two);
    New_Line(2);

    Put_Line("För DS3:");
    Put (Get_Preprint);
    Get (Data_Three);
    Skip_Line;

    Put (Put_Preprint);
    Put (Data_Three);
    New_Line;
end Array_Handling;
