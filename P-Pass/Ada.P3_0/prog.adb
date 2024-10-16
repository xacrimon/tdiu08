with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Prog is

    type U_1_Type is 
        array (91 .. 93) of Character;

    type U_Type is 
        array (Character range 'B' .. 'C', False .. True) of U_1_Type;

    type T_Type is record
        U : U_Type;
        X : Float;
    end record;

    procedure Get (Data : out U_1_Type) is
        Tmp : Character;
    begin
        for i in reverse Data'Range loop
            Get (Data (i));
            if i /= Data'First then
                Get (Tmp);
            end if;
        end loop;
    end Get;

    procedure Put (Data : in U_1_Type) is
    begin
        for i in Data'Range loop
            Put (Data (i));
            if i /= Data'Last then
                Put (' ');
            end if;
        end loop;
    end Put;

    procedure Get (Data : out U_Type) is
        Tmp : Character;
    begin
        for j in Data'Range (2) loop
            for i in Data'Range (1) loop
                Get (Data (i, j));
                if not (i = Data'Last (1) and j = Data'Last (2)) then 
                    Get (Tmp);
                end if;
            end loop;
        end loop;
    end Get;

    procedure Put (Data : in U_Type) is
    begin
        for j in Data'Range (2) loop
            for i in Data'Range (1) loop
                Put (Data (i, j));
                if not (i = Data'Last (1) and j = Data'Last (2)) then 
                    Put (' ');
                end if;
            end loop;
        end loop;
    end Put;

    procedure Get (Data : out T_Type) is
        Tmp : Character;
    begin
        Get (Data.U);
        Get (Tmp);
        Get (Data.X);
    end Get;

    procedure Put (Data : in T_Type) is
    begin
        Put (Data.U);
        Put (' ');
        Put (Data.X, Fore => 0, Aft => 2, Exp => 0);
    end Put;

    Data : T_Type;
begin
    Ada.Text_IO.Put ("Mata in datamängd: ");
    Get (Data);
    Skip_Line;

    Ada.Text_IO.Put ("Inmatad datamängd: ");
    Put (Data);
    New_Line;
end Prog;