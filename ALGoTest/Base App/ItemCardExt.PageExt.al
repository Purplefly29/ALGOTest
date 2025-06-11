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
        }
    }
}