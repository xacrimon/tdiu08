-- matol699: Samarbetat med joewe275, Joel Wejdenstål, samma program

with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;
with Ada.Numerics;                      use Ada.Numerics;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure RecordManipulation is
    type DS1 is record
        W : Character;
        P : String(1..80);
    end record;

    type DS2_U is record
        S : Float;
        Z : String(1..80);
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

    procedure GetOne is
    begin
        Put_Line("Hello, world!");
    end GetOne;

    procedure PutOne is
    begin
        Put_Line("Hello, world!");
    end PutOne;

    procedure GetTwo is
    begin
        Put_Line("Hello, world!");
    end GetTwo;

    procedure PutTwo is
    begin
        Put_Line("Hello, world!");
    end PutTwo;

    procedure GetThree is
    begin
        Put_Line("Hello, world!");
    end GetThree;

    procedure PutThree is
    begin
        Put_Line("Hello, world!");
    end PutThree;
begin
    Put_Line("Hello, world!");
end RecordManipulation;
