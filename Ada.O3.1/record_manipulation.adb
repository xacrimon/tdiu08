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

    procedure Get(Data : out Boolean) is
        Scratch : Character;
    begin
        Get(Scratch);
        if Scratch = 'T' then
            Data := True;
        else
            Data := False;
        end if;
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
        Scratch : Character;
    begin
        Get(Data.W);
        Get(Scratch);
        Get(Data.P);
        Skip_Line;
    end Get;

    procedure Put(Data : in DS1) is
    begin
        Put(Data.W);
        Put(" ");
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
        Scratch : Character;
    begin
        Get(Data.D.S);
        Get(Scratch);
        Get(Data.D.Z);
        Get(Data.U.S);
        Get(Scratch);
        Get(Data.U.Z);
        Skip_Line;
    end Get;

    procedure Put(Data : in DS2) is
    begin
        Put(Data.D.S, Fore => 0, Aft => 3, Exp => 0);
        Put(" ");
        Put(Data.D.Z);
        Put(" ");
        Put(Data.U.S, Fore => 0, Aft => 3, Exp => 0);
        Put(" ");
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
        Scratch : Character;
    begin
        Get(Data.J.Y);
        Get(Scratch);
        Get(Data.J.Q);
        Get(Scratch);
        Get(Data.B.Y);
        Get(Scratch);
        Get(Data.B.Q);
        Get(Scratch);
        Get(Data.O.T);
        Get(Scratch);
        Get(Data.O.L);
        Skip_Line;
    end Get;

    procedure Put(Data : in DS3) is
    begin
        Put(Data.J.Y);
        Put(" ");
        Put(Data.J.Q);
        Put(" ");
        Put(Data.B.Y);
        Put(" ");
        Put(Data.B.Q);
        Put(" ");
        Put(Data.O.T);
        Put(" ");
        Put(Data.O.L);
    end Put;

    Data_One : DS1;
    Data_Two : DS2;
    Data_Three : DS3;
begin
    Put_Line("För DS1:");
    Put(GetPreprint);
    Get(Data_One);

    Put(PutPreprint);
    Put(Data_One);
    New_Line(2);

    Put_Line("För DS2:");
    Put(GetPreprint);
    Get(Data_Two);

    Put(PutPreprint);
    Put(Data_Two);
    New_Line(2);

    Put_Line("För DS3:");
    Put(GetPreprint);
    Get(Data_Three);

    Put(PutPreprint);
    Put(Data_Three);
    New_Line(1);
end Record_Manipulation;
