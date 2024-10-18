with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Unchecked_Deallocation;

package body Sorted_List is

    procedure Free_List is new Ada.Unchecked_Deallocation
        (Object => Node, Name => List_Type);

    function Empty (List : in List_Type) return Boolean is
    begin
        if List = null then
            return True;
        else 
            return False;
        end if; 
    end Empty;

    procedure Insert (List  : in out List_Type;
                      Value : in     Integer) is
        Tmp : List_Type;
    begin
        if Empty (List) then 
            List := new Node'(Value, null);
            return;
        end if;

        if List.Data < Value then
            Insert (List.Next, Value);
        elsif List.Data = Value then
            return;
        else
            Tmp := List.Next;
            List.Next := new Node'(List.Data, Tmp);
            List.Data := Value;
        end if;
    end Insert;

    procedure Put (List : in List_Type) is
    begin
        if Empty (List) then
            return;
        end if;

        Put (' ');
        Put (List.Data, Width => 0);
        Put (List.Next);
    end Put;
    
    function Member (List  : in List_Type;
                     Value : in Integer) return Boolean is
    begin
        if Empty (List) then
            return False;
        end if;
        
        if List.Data = Value then
            return True;
        else
            return Member (List.Next, Value);
        end if;
    end Member;

    procedure Remove (List  : in out List_Type;
                      Value : in     Integer) is
        Tmp : List_Type;
    begin
        if Empty (List) then
            raise No_Such_Element_Error;
        end if;

        if List.Data = Value then
            Tmp := List.Next;
            Free_List (List);
            List := Tmp;
            return;
        else
            Remove (List.Next, Value);
        end if;
    end Remove;

    procedure Delete (List : in out List_Type) is
        Tmp : List_Type;
    begin
        if Empty (List) then
            return;
        end if;

        Tmp := List.Next;
        Free_List (List);
        Delete (Tmp);
    end Delete;

    function Length (List : in List_Type) return Integer is
    begin
        if Empty (List) then
            return 0;
        end if;

        return Length (List.Next) + 1;
    end Length;

end Sorted_List;