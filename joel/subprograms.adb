-- joewe275: Arbetat enskilt

with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Subprograms is
    -- Deluppgift 1.
    -- Notering för assistent: Left-hand-side och Right-hand-side av operatorn.
    function "-" (Lhs : in String;
                  Rhs : in Integer) return Integer is
    begin
        return Integer'Value(Lhs) - Rhs;
    end "-";

    -- Deluppgift 2.
    procedure ComputeCircleArea(Radius : in Integer;
                                Area : out Integer) is
        F_Radius : Float := Float(Radius);
        F_Area : Float;
    begin
        F_Area := F_Radius * F_Radius * 3.14;
        Area := Integer(Float'Floor(F_Area));
    end ComputeCircleArea;

    -- Deluppgift 3.
    function ComputeEquilateralTriangleArea(Side : in Float) return Float is
        Raw_Area : Float;
    begin
        Raw_Area := Side * (Side * Sqrt(3.0) / 2.0) / 2.0;
        return Float'Floor(Raw_Area);
    end ComputeEquilateralTriangleArea;

    -- Variabler för deluppgift 1.
    DiffLhs : String(1..3);
    DiffRhs, DiffResult : Integer;

    -- Variabler för deluppgift 2.
    Radius : Integer;
    CircleArea: Integer;

    -- Variabler för deluppgift 3.
    Side : Float;
    TriangleArea : Float;
begin
    -- Deluppgift 1 inläsning och beräkning.
    Put("Mata in en sträng: ");
    Get(DiffLhs);
    Put("Mata in ett heltal: ");
    Get(DiffRhs);
    Skip_Line;
    DiffResult := DiffLhs - DiffRhs;

    -- Deluppgift 1 utmatning.
    Put("Den beräknade differensen mellan ");
    Put(DiffLhs);
    Put(" och ");
    Put(DiffRhs, Width => 0);
    Put(" blir ");
    Put(DiffResult, Width => 0);
    New_Line(2);

    -- Deluppgift 2 inläsning och beräkning.
    Put("Mata in längden: ");
    Get(Radius);
    Skip_Line;
    ComputeCircleArea(Radius, CircleArea);

    -- Deluppgift 2 utmatning.
    Put("Den beräknade arean blev: ");
    Put(CircleArea, Width => 0);
    New_Line(2);

    -- Deluppgift 3 inläsning och beräkning.
    Put("Mata in längden: ");
    Get(Side);
    Skip_Line;
    TriangleArea := ComputeEquilateralTriangleArea(Side);

    -- Deluppgift 3 utmatning.
    Put("Den beräknade arean blev: ");
    Put(TriangleArea, Fore => 0, Aft => 1, Exp => 0);
    New_Line;
end Subprograms;
