package Date is
    type Date_Type is private;

    Length_Error : exception;
    Format_Error : exception;
    Year_Error   : exception;
    Month_Error  : exception;
    Day_Error    : exception;

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