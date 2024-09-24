-- joewe275: Arbetat enskilt

with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;
with Ada.Numerics;                      use Ada.Numerics;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Subprograms is
    function ComputeAverage(
        D1, D2, D3: in Integer
    ) return Integer is
        Sum, FloatAvg : Float;
    begin
        Sum := Float(D1) + Float(D2) + Float(D3);
        FloatAvg := Sum / 3.0;
        return Integer (Float'Ceiling (FloatAvg));
    end ComputeAverage;

    function "+" (
        A : in String;
        B : in Character
    ) return Integer is
    begin
        return Integer(Float'Value(A) - Float'Value((1 => B)));
    end "+";

    procedure ComputeProduct(
        FactorOne : out Integer;
        FactorTwo : out Float;
        Product: out Integer
    ) is
        ReadChar : Character;
        FloatProduct : Float;
    begin
        Put("Mata in ett tecken: ");
        Get(ReadChar);
        Put("Mata in ett flyttal: ");
        Get(FactorTwo);

        FactorOne := Integer'Value((1 => ReadChar));
        FloatProduct := Float(FactorOne) * FactorTwo;
        if FloatProduct > 0.0 then
            Product := Integer(Float'Ceiling(FloatProduct));
        else
            Product := Integer(Float'Floor(FloatProduct));
        end if;
    end ComputeProduct;

    Int1, Int2, Int3, Average, ReadInt, Product, Difference: Integer;
    ReadFloat: Float;
    ReadString: String(1..3);
    ReadChar: Character;
begin
    Put("Mata in tre heltal: ");
    Get(Int1);
    Get(Int2);
    Get(Int3);
    Average := ComputeAverage(Int1, Int2, Int3);
    Put("Medelvärdet av dessa är: ");
    Put(Average, Width => 0);
    New_Line(2);

    Put("Mata in en sträng: ");
    Get(ReadString);
    Put("Mata in ett tecken: ");
    Get(ReadChar);
    Difference := ReadString + ReadChar;
    Put("Den beräknade differensen mellan ");
    Put(ReadString);
    Put(" och ");
    Put(ReadChar);
    Put(" blir ");
    Put(Difference, Width => 0);
    New_Line(2);

    ComputeProduct(ReadInt, ReadFloat, Product);
    Put("Du matade in tecknet: ");
    Put(ReadInt, Width => 0);
    Put(" och flyttalet: ");
    Put(ReadFloat, Fore => 0, Aft => 0, Exp => 0);
    Put(" och produkten blev ");
    Put(Product);
end Subprograms;
