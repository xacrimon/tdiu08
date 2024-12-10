-- joewe275: Arbetat enskilt

with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;

procedure Data_Handling is
    type Pair is record
        I : Character;
        E : Integer;
    end record;

    type Block is
        array (13 .. 15, Character range 'i' .. 'k') of Pair;

    type Data is
        array (26 .. 29) of Block;

    procedure Eat_Sep is
        Scratch : Character;
    begin
        Get (Scratch);
    end Eat_Sep;

    procedure Write_Sep is
    begin
        Put (" ");
    end Write_Sep;

    procedure Get (Item : out Pair) is
    begin
        Get (Item.I);
        Eat_Sep;
        Get (Item.E);
    end Get;

    procedure Put (Item : in Pair) is
    begin
        Put (Item.I);
        Write_Sep;
        Put (Item.E, Width => 0);
    end Put;

    procedure Get (Item : out Block) is
    begin
        for I in Item'Range (1) loop
            for J in reverse Item'Range (2) loop
                Get (Item (I,J));

                if I /= Item'Last (1) or J /= Item'First (2) then
                    Eat_Sep;
                end if;
            end loop;
        end loop;
    end Get;

    procedure Put (Item : in Block) is
    begin
        for I in reverse Item'Range (1) loop
            for J in Item'Range (2) loop
                Put (Item (I,J));

                if I /= Item'First (1) or J /= Item'Last (2) then
                    Write_Sep;
                end if;
            end loop;
        end loop;
    end Put;

    procedure Debug (Item : in Block) is
    begin
        for I in Item'Range (1) loop
            for J in Item'Range (2) loop
                Put ("(");
                Put (I, Width => 0);
                Put (", ");
                Put (J);
                Put ("): ");
                Put (Item (I,J));

                New_Line;
            end loop;
        end loop;
    end Debug;

    procedure Get (Item : out Data) is
    begin
        for I in Item'Range loop
            Get (Item (I));

            if I /= Item'Last then
                Eat_Sep;
            end if;
        end loop;
    end Get;

    procedure Put (Item : in Data) is
    begin
        for I in reverse Item'Range loop
            Put (Item (I));

            if I /= Item'First then
                Write_Sep;
            end if;
        end loop;
    end Put;

    procedure Debug (Item : in Data) is
    begin
        for I in Item'Range loop
            Put ("block: ");
            Put (I, Width => 0);
            New_Line;
            Debug (Item (I));

            New_Line(2);
        end loop;
    end Debug;

    T : Data;
begin
    Put ("Mata in datamängd: ");
    Get (T);
    Skip_Line;
    
    Put ("Inmatad datamängd: ");
    --Put (T);
    New_Line;
    Debug (T);
end Data_Handling;
