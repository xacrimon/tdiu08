package Date is
    type Date_Type is private;

    Length_Error : exception;
    Format_Error : exception;
    Year_Error   : exception;
    Month_Error  : exception;
    Day_Error    : exception;

    procedure Get_Correct_String (S : out String);

    function Parse_Date_Field (Field : in String) return Integer;
    procedure Parse_Date (Item :    out Date_Type; 
                          S    : in     String);

    function Days_In_Month (Month, Year : in Integer) return Integer;
    procedure Validate_Date (Item : in Date_Type);
    function Zero_Pad (Value, Length : in Integer) return String;

    procedure Get (Item : out Date_Type);
    procedure Put (Item : in Date_Type);

    function Next_Date (Item : in Date_Type) return Date_Type;
    function Previous_Date (Item : in Date_Type) return Date_Type;

    function "<" (Left, Right : in Date_Type) return Boolean;
    function "=" (Left, Right : in Date_Type) return Boolean;
    function ">" (Left, Right : in Date_Type) return Boolean;
private
    type Date_Type is record
        Day   : Integer;
        Month : Integer;
        Year  : Integer;
    end record;
end Date;