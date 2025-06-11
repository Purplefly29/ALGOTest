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
                ToolTipML = ENU='Specifies the dealer price charged for purchasing the item in the webshop for delivery from the warehouse in Switzerland.',
                           DEU='Gibt den Händlerpreis an, welcher für den Bezug des Artikels im Webshop für die Belieferung aus dem Lager in der Schweiz fällig wird.',
                           ITA='Specifica il prezzo rivenditore addebitato per l''acquisto dell''articolo nel negozio online per la consegna dal magazzino in Svizzera.';
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
                ToolTipML = ENU='Specifies the inventory stock of the item in the warehouse in Switzerland.',
                           DEU='Gibt den Lagerbestand des Artikel im Lager in der Schweiz an.',
                           ITA='Specifica la giacenza di magazzino dell''articolo nel magazzino in Svizzera.';
                Editable = false;
            }
        }
    }
}