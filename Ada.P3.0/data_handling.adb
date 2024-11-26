-- joewe275: Arbetat enskilt

with Ada.Text_IO;           use Ada.Text_IO;

procedure Data_Handling is
    type Set is
        array (-78 .. -76) of String (1 .. 3);

    type Matrix is
        array (Boolean, Boolean) of Set;

    type Data is record
        V : Matrix;
        N : Matrix;
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

    procedure Get (Item : out Set) is
    begin
        for I in Item'Range loop
            Get (Item (I));

            if I /= Item'Last then
                Eat_Sep;
            end if;
        end loop;
    end Get;

    procedure Put (Item : in Set) is
    begin
        for I in reverse Item'Range loop
            Put (Item (I));

            if I /= Item'First then
                Write_Sep;
            end if;
        end loop;
    end Put;

    procedure Get (Item : out Matrix) is
    begin
        for I in Item'Range (1) loop
            for J in Item'Range (2) loop
                Get (Item (I, J));

                if I /= Item'Last (1) or J /= Item'Last (2) then
                    Eat_Sep;
                end if;
            end loop;
        end loop;
    end Get;

    procedure Put (Item : in Matrix) is
    begin
        for I in reverse Item'Range (1) loop
            for J in reverse Item'Range (2) loop
                Put (Item (I, J));

                if I /= Item'First (1) or J /= Item'First (2) then
                    Write_Sep;
                end if;
            end loop;
        end loop;
    end Put;

    procedure Get (Item : out Data) is
    begin
        Get (Item.V);
        Eat_Sep;
        Get (Item.N);
    end Get;

    procedure Put (Item : in Data) is
    begin
        Put (Item.V);
        Write_Sep;
        Put (Item.N);
    end Put;

    T : Data;
begin
    Put ("Mata in datamängd: ");
    Get (T);
    Skip_Line;
    
    Put ("Inmatad datamängd: ");
    Put (T);
    New_Line;
end Data_Handling;
