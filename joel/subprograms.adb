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
begin
    Put_Line("Hello, World!");
end Subprograms;
