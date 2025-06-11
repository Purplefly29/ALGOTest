pageextension 55002 ItemListExtJTISHB extends "Item List"
{
    layout
    {
        addafter(Description)
        {
            field("EAN"; Rec."EAN")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the EAN code for the item.';
            }
            field("Inventory HAUPT"; Rec."Inventory HAUPT")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the main inventory stock for the item.';
            }
            field("Sum Efforts Hours"; Rec."Sum Efforts Hours")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the sum of efforts in hours.';
            }
            field("Sum Efforts LT"; Rec."Sum Efforts LT")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the sum of efforts in LT.';
            }
        }
    }

    trigger OnOpenPage();
    begin
        Message(HelloWorldLbl);
    end;

    var
        HelloWorldLbl: Label 'App published: Hello World', Comment = 'Message displayed when opening Item List page';
}