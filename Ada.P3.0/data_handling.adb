-- joewe275: Arbetat enskilt

with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Float_Text_IO;     use Ada.Float_Text_IO;

procedure Data_Handling is
    type Innermost_Top is record
        S : Float;
        U : Character;
    end record;

    type Top_Integer_Array is
        array (-53 .. -52) of Innermost_Top;
    
    type Top_Char_Map is
        array (Character range '5' .. '6') of Top_Integer_Array;

    type Bottom is
        array (Character range 'M' .. 'O', 71 .. 73) of Float;

    type Outer is record
        H : Top_Char_Map;
        D : Bottom;
    end record;

    type Wrapper is record
        T : Outer;
    end record;

    procedure Eat_Sep is
        Scratch : Character;
    begin
        Get (Scratch);
    end Eat_Sep;

    procedure Write_Sep is
    begin
        Put (" ");
    end Write_Sep;

    procedure Get (Data : out Innermost_Top) is
    begin
        Get(Data.S);
        Eat_Sep;
        Get(Data.U);
    end Get;

    procedure Put (Data : in Innermost_Top) is
    begin
        Put(Data.S, Fore => 0, Aft => 1, Exp => 0);
        Write_Sep;
        Put(Data.U);
    end Put;

    procedure Get (Data : out Top_Integer_Array) is
    begin
        for I in Data'Range loop
            Get(Data (I));

            if I /= Data'Last then
                Eat_Sep;
            end if;
        end loop;
    end Get;

    procedure Put (Data : in Top_Integer_Array) is
    begin
        for I in reverse Data'Range loop
            Put(Data (I));

            if I /= Data'First then
                Write_Sep;
            end if;
        end loop;
    end Put;

    procedure Get (Data : out Top_Char_Map) is
    begin
        for I in Data'Range loop
            Get(Data (I));

            if I /= Data'Last then
                Eat_Sep;
            end if;
        end loop;
    end Get;

    procedure Put (Data : in Top_Char_Map) is
    begin
        for I in Data'Range loop
            Put(Data (I));

            if I /= Data'Last then
                Write_Sep;
            end if;
        end loop;
    end Put;

    procedure Get (Data : out Bottom) is
    begin
        for I in Data'Range (1) loop
            for J in reverse Data'Range (2) loop
                Get (Data (I, J));

                if I /= Data'Last (1) or J /= Data'First (2) then
                    Eat_Sep;
                end if;
            end loop;
        end loop;
    end Get;

    procedure Put (Data : in Bottom) is
    begin
        for I in reverse Data'Range (1) loop
            for J in Data'Range (2) loop
                Put (Data (I, J), Fore => 0, Aft => 2, Exp => 0);

                if I /= Data'First (1) or J /= Data'Last (2) then
                    Write_Sep;
                end if;
            end loop;
        end loop;
    end Put;

    procedure Get (Data : out Outer) is
    begin
        Get(Data.H);
        Eat_Sep;
        Get(Data.D);
    end Get;

    procedure Put (Data : in Outer) is
    begin
        Put(Data.H);
        Write_Sep;
        Put(Data.D);
    end Put;

    procedure Get (Data : out Wrapper) is
    begin
        Get(Data.T);
    end Get;

    procedure Put (Data : in Wrapper) is
    begin
        Put(Data.T);
    end Put;

    Data : Wrapper;
begin
    Put ("Mata in datamängd: ");
    Get (Data);
    Skip_Line;
    
    Put ("Inmatad datamängd: ");
    Put (Data);
    New_Line;
end Data_Handling;
