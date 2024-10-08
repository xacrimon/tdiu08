-- matol699: Samarbetat med joewe275, Joel Wejdenstål, samma program

with Ada.Text_IO;       use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Record_Manipulation is
    Get_Preprint : constant String := "Mata in datamängd: ";
    Put_Preprint : constant String := "Inmatad datamängd: ";

    type DS1 is record
        W : Character;
        P : String (1 .. 4);
    end record;

    type DS2_U is record
        S : Float;
        Z : String (1 .. 4);
    end record;

    type DS2 is record
        D : DS2_U;
        U : DS2_U;
    end record;

    type DS3_U1 is record
        Y : Character;
        Q : Character;
    end record;

    type DS3_U2 is record
        T : Boolean;
        L : Character;
    end record;

    type DS3 is record
        J : DS3_U1;
        B : DS3_U1;
        O : DS3_U2;
    end record;

    procedure Eat_Separator is
        Scratch : Character;
    begin
        Get (Scratch);
    end Eat_Separator;

    procedure Write_Separator is
    begin
        Put (" ");
    end Write_Separator;

    procedure Get (Data : out Boolean) is
        Scratch : Character;
    begin
        Get (Scratch);
        case Scratch is
            when 'T' =>
                Data := True;
            when 'F' =>
                Data := False;
            when others =>
                null;
        end case;
    end Get;

    procedure Put (Data : in Boolean) is
    begin
        if Data then
            Put ("True");
        else
            Put ("False");
        end if;
    end Put;

    procedure Get (Data : out DS1) is
    begin
        Get (Data.W);
        Eat_Separator;
        Get (Data.P);
    end Get;

    procedure Put (Data : in DS1) is
    begin
        Put (Data.W);
        Write_Separator;
        Put (Data.P);
    end Put;

    procedure Get (Data : out DS2_U) is
    begin
        Get (Data.S);
        Eat_Separator;
        Get (Data.Z);
    end Get;

    procedure Put (Data : in DS2_U) is
    begin
        Put (Data.S, Fore => 0, Aft => 3, Exp => 0);
        Write_Separator;
        Put (Data.Z);
    end Put;

    procedure Get (Data : out DS2) is
    begin
        Get (Data.D);
        Eat_Separator;
        Get (Data.U);
    end Get;

    procedure Put (Data : in DS2) is
    begin
        Put (Data.D);
        Write_Separator;
        Put (Data.U);
    end Put;

    procedure Get (Data : out DS3_U1) is
    begin
        Get (Data.Y);
        Eat_Separator;
        Get (Data.Q);
    end Get;

    procedure Put (Data : in DS3_U1) is
    begin
        Put (Data.Y);
        Write_Separator;
        Put (Data.Q);
    end Put;

    procedure Get (Data : out DS3_U2) is
    begin
        Get (Data.T);
        Eat_Separator;
        Get (Data.L);
    end Get;

    procedure Put (Data : in DS3_U2) is
    begin
        Put (Data.T);
        Write_Separator;
        Put (Data.L);
    end Put;

    procedure Get (Data : out DS3) is
    begin
        Get (Data.J);
        Eat_Separator;
        Get (Data.B);
        Eat_Separator;
        Get (Data.O);
    end Get;

    procedure Put (Data : in DS3) is
    begin
        Put (Data.J);
        Write_Separator;
        Put (Data.B);
        Write_Separator;
        Put (Data.O);
    end Put;

    Data_One   : DS1;
    Data_Two   : DS2;
    Data_Three : DS3;
begin
    Put_Line ("För DS1:");
    Put (Get_Preprint);
    Get (Data_One);
    Skip_Line;

    Put (Put_Preprint);
    Put (Data_One);
    New_Line (2);

    Put_Line ("För DS2:");
    Put (Get_Preprint);
    Get (Data_Two);
    Skip_Line;

    Put (Put_Preprint);
    Put (Data_Two);
    New_Line (2);

    Put_Line ("För DS3:");
    Put (Get_Preprint);
    Get (Data_Three);
    Skip_Line;

    Put (Put_Preprint);
    Put (Data_Three);
    New_Line (1);
end Record_Manipulation;
