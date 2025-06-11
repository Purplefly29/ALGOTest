xmlport 55006 "Item Lager-CH Import"
{
    Format = Xml;
    Direction = Both;
    
    schema
    {
        textelement(Root)
        {
            tableelement(Item; Item)
            {
                fieldelement(nummer; Item."No.")
                {
                }
                fieldelement(bestandlagerch; Item."Swiss Warehouse Stock")
                {
                }
                fieldelement(verkaufspreishändlerlagerch; Item."Swiss Warehouse Dealer Price")
                {
                }
                
                trigger OnBeforeInsertRecord()
                var
                    ItemRec: Record Item;
                begin
                    // Check if item exists before trying to update
                    if not ItemRec.Get(Item."No.") then
                        currXMLport.Skip()
                    else begin
                        // Update existing item
                        ItemRec."Swiss Warehouse Stock" := Item."Swiss Warehouse Stock";
                        ItemRec."Swiss Warehouse Dealer Price" := Item."Swiss Warehouse Dealer Price";
                        ItemRec.Modify();
                        currXMLport.Skip(); // Skip the insert since we already updated
                    end;
                end;
            }
        }
    }
}