-- joewe275: Samarbetat med matol699, Mattis Olevall, samma program

with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;
with Ada.Numerics;                      use Ada.Numerics;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Record_Manipulation is
    type DS1 is record
        W : Character;
        P : String(1..4);
    end record;

    procedure Get(Data : out DS1) is
        Scratch : Character;
    begin
        Put_Line("För DS1:");
        Put("Mata in datamängd: ");
        Get(Data.W);
        Get(Scratch);
        Get(Data.P);
        Skip_Line;
    end Get;

    procedure Put(Data : in DS1) is
    begin
        Put("Inmatad datamängd: ");
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
        Put_Line("För DS2:");
        Put("Mata in datamängd: ");
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
        Put("Inmatad datamängd: ");
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
        Put_Line("För DS3:");
        Put("Mata in datamängd: ");
        Get(Data.J.Y);
        Get(Scratch);
        Get(Data.J.Q);
        Get(Scratch);
        Get(Data.B.Y);
        Get(Scratch);
        Get(Data.B.Q);
        Get(Scratch);

        Get(Scratch);
        if Scratch = 'T' then
            Data.O.T := True;
        else
            Data.O.T := False;
        end if;

        Get(Scratch);
        Get(Data.O.L);
        Skip_Line;
    end Get;

    procedure Put(Data : in DS3) is
    begin
        Put("Inmatad datamängd: ");
        Put(Data.J.Y);
        Put(" ");
        Put(Data.J.Q);
        Put(" ");
        Put(Data.B.Y);
        Put(" ");
        Put(Data.B.Q);
        Put(" ");

        if Data.O.T then
            Put("True");
        else
            Put("False");
        end if;

        Put(" ");
        Put(Data.O.L);
    end Put;

    Data_One : DS1;
    Data_Two : DS2;
    Data_Three : DS3;
begin
    Get(Data_One);
    Put(Data_One);
    New_Line(2);
    Get(Data_Two);
    Put(Data_Two);
    New_Line(2);
    Get(Data_Three);
    Put(Data_Three);
    New_Line(1);
end Record_Manipulation;
