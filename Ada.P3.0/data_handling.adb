-- joewe275: Arbetat enskilt

with Ada.Text_IO;           use Ada.Text_IO;

procedure Data_Handling is
    type Inner is record
        W : String (1 .. 3);
        B : String (1 .. 3);
    end record;

    type Middle is
        array (Character range 'a' .. 'd', -99 .. -97) of Inner;

    type Outer is
        array (92 .. 94) of Middle;

    procedure Eat_Sep is
        Scratch : Character;
    begin
        Get (Scratch);
    end Eat_Sep;

    procedure Write_Sep is
    begin
        Put (" ");
    end Write_Sep;

    procedure Get (Data : out Inner) is
    begin
        Get (Data.W);
        Eat_Sep;
        Get (Data.B);
    end Get;

    procedure Put (Data : in Inner) is
    begin
        Put (Data.W);
        Write_Sep;
        Put (Data.B);
    end Put;

    procedure Get (Data : out Middle) is
    begin
        for X in Data'Range (1) loop
            for Y in Data'Range (2) loop
                Get (Data (X, Y));
                if not (X = Data'Last (1) and Y = Data'Last (2)) then 
                    Eat_Sep;
                end if;
            end loop;
        end loop;
    end Get;

    procedure Put (Data : in Middle) is
    begin
        for X in reverse Data'Range (1) loop
            for Y in Data'Range (2) loop
                Put (Data (X, Y));
                if not (X = Data'First (1) and Y = Data'Last (2)) then 
                    Write_Sep;
                end if;
            end loop;
        end loop;
    end Put;

    procedure Get (Data : out Outer) is
    begin
        for X in Data'Range loop
            Get (Data (X));
            if X /= Data'Last then 
                Eat_Sep;
            end if;
        end loop;
    end Get;

    procedure Put (Data : in Outer) is
    begin
        for X in reverse Data'Range loop
            Put (Data (X));
            if X /= Data'First then 
                Write_Sep;
            end if;
        end loop;
    end Put;

    Data : Outer;
begin
    Put ("Mata in datamängd: ");
    Get (Data);
    Skip_Line;
    
    Put ("Inmatad datamängd: ");
    Put (Data);
    New_Line;
end Data_Handling;
