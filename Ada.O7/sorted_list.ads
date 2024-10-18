package Sorted_List is
    type List_Type is private;

    No_Such_Element_Error : exception;

    function Empty (List : in List_Type) return Boolean;
    procedure Insert (List  : in out List_Type;
                      Value : in     Integer);
    procedure Put (List : in List_Type);
    function Member (List  : in List_Type;
                     Value : in Integer) return Boolean;
    procedure Remove (List  : in out List_Type;
                      Value : in     Integer);
    procedure Delete (List : in out List_Type);
    function Length (List : in List_Type) return Integer;
private
    type Node is record
        Data : Integer;
        Next : List_Type;
    end record;

    type List_Type is access Node;
end Sorted_List;