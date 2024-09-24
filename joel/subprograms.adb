-- joewe275: Arbetat enskilt

with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;
with Ada.Numerics;                      use Ada.Numerics;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Subprograms is
    function ComputeAverage(
        D1, D2, D3: Integer
    ) return Integer is
    begin
        return Integer (Float'Ceiling ((Float(D1) + Float(D2) + Float(D3)) / 3.0));
    end ComputeAverage;

    function "+" (A    : String;
                 B : Character)
                 return Integer
   is
   begin
      return Integer'Value(A) - Integer'Value((1 => B));
   end "+";

    procedure ComputeProduct(
        ReadInt : out Integer;
        ReadFloat : out Float;
        Product: out Integer
    ) is
        C : Character;
        FloatProduct : Float;
    begin
        Put("Mata in ett tecken: ");
        Get(C);
        Put("Mata in ett flyttal: ");
        Get(ReadFloat);

        ReadInt := Integer'Value((1 => C));
        FloatProduct := ReadFloat * Float(ReadInt);
        if FloatProduct > 0.0 then
            Product := Integer(Float'Ceiling(FloatProduct));
        else
            Product := Integer(Float'Floor(FloatProduct));
        end if;
    end ComputeProduct;

    D1, D2, D3, Average, ReadInt, Product: Integer;
    ReadFloat: Float;
    S: String(1..3);
    C: Character;
    Diff: Integer;
begin
    Put("Mata in tre heltal: ");
    Get(D1);
    Get(D2);
    Get(D3);
    Average := ComputeAverage(D1, D2, D3);
    Put("Medelvärdet är: ");
    Put(Average, Width => 0);
    New_Line;

    Put("Mata in en sträng: ");
    Get(S);
    Put("Mata in ett tecken: ");
    Get(C);
    Diff := S + C;
    Put("Den beräknade differensen mellan ");
    Put(S);
    Put(" och ");
    Put(C);
    Put(" blir ");
    Put(Diff, Width => 0);
    New_Line;

    ComputeProduct(ReadInt, ReadFloat, Product);
    Put("Du matade in tecknet: ");
    Put(ReadInt, Width => 0);
    Put(" och flyttalet: ");
    Put(ReadFloat, Fore => 0, Aft => 0, Exp => 0);
    Put(" och produkten blev ");
    Put(Product);
end Subprograms;
