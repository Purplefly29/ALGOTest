pageextension 55005 ItemCardExt extends "Item Card"
{
    layout
    {
        // Add field to "Preis und Verkauf" (Pricing & Sales) tab
        addafter("Unit Cost")
        {
            field("Swiss Warehouse Dealer Price"; Rec."Swiss Warehouse Dealer Price")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the dealer price charged for purchasing the item in the webshop for delivery from the warehouse in Switzerland.';
                Editable = false;
                Visible = false;
            }
            field("Direct Unit Cost"; Rec."Direct Unit Cost")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the direct unit cost for the item.';
            }
            field("Currency Code"; Rec."Currency Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the currency code for the item.';
            }
            field("Shipping Rate %"; Rec."Shipping Rate %")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the shipping rate percentage for cost calculation.';
            }
            field("Duty Costs %"; Rec."Duty Costs %")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the duty costs percentage.';
            }
        }
        
        // Add field to "Lagerbestand" (Inventory) tab  
        addafter("Qty. on Purch. Order")
        {
            field("Swiss Warehouse Stock"; Rec."Swiss Warehouse Stock")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the inventory stock of the item in the warehouse in Switzerland.';
                Editable = false;
            }
            field("Inventory HAUPT"; Rec."Inventory HAUPT")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the main inventory stock for the item.';
            }
            field("Qty. on Sales Quote"; Rec."Qty. on Sales Quote")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the quantity on sales quotes.';
            }
            field("Assembly (Qty.) without C.Memo"; Rec."Assembly (Qty.) without C.Memo")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the assembly quantity without credit memos.';
            }
            field("Asm. (UnitPrice) without C.Mem"; Rec."Asm. (UnitPrice) without C.Mem")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the assembly unit price without credit memos.';
            }
        }

        // Add to "Allgemein" (General) tab
        addafter(Description)
        {
            field("Description 3"; Rec."Description 3")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies an additional description for the item.';
            }
            field("EAN"; Rec."EAN")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the EAN code for the item.';
            }
            field("Last Purchase Date"; Rec."Last Purchase Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the last purchase date for the item.';
                Editable = false;
            }
            field("Blocked2"; Rec."Blocked2")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies if the item is blocked.';
            }
        }
    }
}