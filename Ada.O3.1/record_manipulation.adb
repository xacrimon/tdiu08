-- joewe275: Samarbetat med matol699, Mattis Olevall, samma program

with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;
with Ada.Numerics;                      use Ada.Numerics;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

-- TODO: bool get/put

procedure Record_Manipulation is
    GetPreprint : String := "Mata in datamängd: ";
    PutPreprint : String := "Inmatad datamängd: ";

    procedure EatSeparator is
        NoSpaceFound : exception;
        Scratch : Character;
    begin
        Get(Scratch);
        if Scratch /= ' ' then
            raise NoSpaceFound;
        end if;
    end EatSeparator;

    procedure WriteSeparator is
    begin
        Put(" ");
    end WriteSeparator;

    procedure Get(Data : out Boolean) is
        InvalidBoolean : exception;
        Scratch : Character;
    begin
        Get(Scratch);
        case Scratch is
        when 'T' =>
            Data := True;
        when 'F' =>
            Data := False;
        when others => raise InvalidBoolean;
        end case;
    end Get;

    procedure Put(Data : in Boolean) is
    begin
        if Data then
            Put("True");
        else
            Put("False");
        end if;
    end Put;

    type DS1 is record
        W : Character;
        P : String(1..4);
    end record;

    procedure Get(Data : out DS1) is
    begin
        Get(Data.W);
        EatSeparator;
        Get(Data.P);
    end Get;

    procedure Put(Data : in DS1) is
    begin
        Put(Data.W);
        WriteSeparator;
        Put(Data.P);
    end Put;

    type DS2_U is record
        S : Float;
        Z : String(1..4);
    end record;

    type DS2 is record
        D : DS2_U;
        U : DS2_U;
    end record;

    procedure Get(Data : out DS2) is
    begin
        Get(Data.D.S);
        EatSeparator;
        Get(Data.D.Z);
        Get(Data.U.S);
        EatSeparator;
        Get(Data.U.Z);
    end Get;

    procedure Put(Data : in DS2) is
    begin
        Put(Data.D.S, Fore => 0, Aft => 3, Exp => 0);
        WriteSeparator;
        Put(Data.D.Z);
        WriteSeparator;
        Put(Data.U.S, Fore => 0, Aft => 3, Exp => 0);
        WriteSeparator;
        Put(Data.U.Z);
    end Put;

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

    procedure Get(Data : out DS3) is
    begin
        Get(Data.J.Y);
        EatSeparator;
        Get(Data.J.Q);
        EatSeparator;
        Get(Data.B.Y);
        EatSeparator;
        Get(Data.B.Q);
        EatSeparator;
        Get(Data.O.T);
        EatSeparator;
        Get(Data.O.L);
    end Get;

    procedure Put(Data : in DS3) is
    begin
        Put(Data.J.Y);
        WriteSeparator;
        Put(Data.J.Q);
        WriteSeparator;
        Put(Data.B.Y);
        WriteSeparator;
        Put(Data.B.Q);
        WriteSeparator;
        Put(Data.O.T);
        WriteSeparator;
        Put(Data.O.L);
    end Put;

    Data_One : DS1;
    Data_Two : DS2;
    Data_Three : DS3;
begin
    Put_Line("För DS1:");
    Put(GetPreprint);
    Get(Data_One);
    Skip_Line;

    Put(PutPreprint);
    Put(Data_One);
    New_Line(2);

    Put_Line("För DS2:");
    Put(GetPreprint);
    Get(Data_Two);
    Skip_Line;

    Put(PutPreprint);
    Put(Data_Two);
    New_Line(2);

    Put_Line("För DS3:");
    Put(GetPreprint);
    Get(Data_Three);
    Skip_Line;

    Put(PutPreprint);
    Put(Data_Three);
    New_Line(1);
end Record_Manipulation;
