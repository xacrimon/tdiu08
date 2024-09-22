-- matol699: Samarbetat med joewe275, Joel Wejdenstål, samma program

with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                 use Ada.Float_Text_IO;
with Ada.Numerics;                      use Ada.Numerics;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Calculator is
    Selection : Integer;
    
    function Calculate_Hypothenuse (A, B : in Integer) return Float;
    function Calculate_Factorial (N : in Integer) return Integer;
    procedure Calculate_Angles (Hc, Sa : in Float; Va, Vb, Vc : out Float);

    procedure Menu_Selection (Selection : out Integer) is
    begin
        Put_Line("=== HUVUDMENY ===");
        Put_Line("1. Beräkna hypotenusa");
        Put_Line("2. Beräkna triangelvinklar");
        Put_Line("3. Beräkna N-fakultet");
        Put_Line("4. Avsluta programmet");

        loop
            Put("Val: ");
            Get(Selection);
            Skip_Line;

            if Selection < 1 or Selection > 4 then
                Put_Line("Felaktigt val!");
            else
                exit;
            end if;
                
        end loop;
    end  Menu_Selection;

    procedure Hypothenuse_Program is
        A, B : Integer;
    begin
        Put("Mata in kateternas längder: ");
        Get(A);
        Get(B);
        Skip_Line;
        Put("Hypotenusan är ");
        Put(Calculate_Hypothenuse(A, B), Fore => 0, Aft => 2, Exp => 0);
        New_Line;
    end Hypothenuse_Program;

    procedure Angle_Program is
        Hc, Sa, Va, Vb, Vc : Float;
    begin
        Put("Mata in hypotenusans längd: ");
        Get(Hc);
        Skip_Line;
        Put("Mata in vertikala katetens längd: ");
        Get(Sa);
        Skip_Line;

        Calculate_Angles(Hc, Sa, Va, Vb, Vc);
        Put("Va: ");
        Put(Va, Fore => 0, Aft => 1, Exp => 0);
        Put(" grader");
        New_Line;

        Put("Vb: ");
        Put(Vb, Fore => 0, Aft => 1, Exp => 0);
        Put(" grader");
        New_Line;

        Put("Vc: ");
        Put(Vc, Fore => 0, Aft => 1, Exp => 0);
        Put(" grader");
        New_Line;
    end Angle_Program;

    procedure Factorial_Program is
        I : Integer;
    begin
        Put("Mata in N: ");
        Get(I);
        Skip_Line;
        Put(I, Width => 0);
        Put("-fakultet = ");
        Put(Calculate_Factorial(I), Width => 0);
        New_Line;
    end Factorial_Program;

    procedure Calculate_Angles (Hc, Sa : in Float; Va, Vb, Vc : out Float) is
    begin 
        Vb := arccos(Sa / Hc) * 180.0 / Pi;
        Va := 90.0 - Vb;
        Vc := 90.0;
    end Calculate_Angles;

    function Calculate_Hypothenuse (A, B : in Integer) return Float is
        Af, Bf : Float; 
    begin
        Af := Float(A);
        Bf := Float(B);

        return Sqrt(Af**2 + Bf**2);
    end Calculate_Hypothenuse;

    function Calculate_Factorial (N : in Integer) return Integer is
        Product : Integer;
    begin
        Product := 1;

        for I in 1..N loop
            Product := Product * I;
        end loop;

        return Product;
    end Calculate_Factorial;

begin
    Put_Line("Välkommen till miniräknaren!");

    loop
        Menu_Selection(Selection);

        case Selection is
            when 1  => Hypothenuse_Program;
            when 2  => Angle_Program;
            when 3  => Factorial_Program;
            when others => exit;
        end case;

        New_Line;
    end loop;

    Put_Line("Ha en bra dag!");
end Calculator;
