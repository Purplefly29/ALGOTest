pageextension 55005 ItemCardExt extends "Item Card"
{
    layout
    {
        // Add field to "Preis und Verkauf" (Pricing & Sales) tab
        addafter("Unit Cost")
        {
            field("Händlerpreis Lager-CH"; Rec."Händlerpreis Lager-CH")
            {
                ApplicationArea = All;
                ToolTip = 'Gibt den Händlerpreis an, welcher für den Bezug des Artikels im Webshop für die Belieferung aus dem Lager in der Schweiz fällig wird.';
                Editable = false;
                Visible = false;
            }
        }
        
        // Add field to "Lagerbestand" (Inventory) tab  
        addafter("Qty. on Purch. Order")
        {
            field("Bestand Lager-CH"; Rec."Bestand Lager-CH")
            {
                ApplicationArea = All;
                ToolTip = 'Gibt den Lagerbestand des Artikel im Lager in der Schweiz an.';
                Editable = false;
            }
        }
    }
}