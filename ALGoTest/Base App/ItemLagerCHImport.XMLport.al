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
                fieldelement(bestandlagerch; Item."Bestand Lager-CH")
                {
                }
                fieldelement(verkaufspreishändlerlagerch; Item."Händlerpreis Lager-CH")
                {
                }
                
                trigger OnBeforeInsertRecord()
                var
                    ExistingItem: Record Item;
                begin
                    // Check if item exists before trying to update
                    if not ExistingItem.Get(Item."No.") then
                        currXMLport.Skip()
                    else begin
                        // Update existing item
                        ExistingItem."Bestand Lager-CH" := Item."Bestand Lager-CH";
                        ExistingItem."Händlerpreis Lager-CH" := Item."Händlerpreis Lager-CH";
                        ExistingItem.Modify();
                        currXMLport.Skip(); // Skip the insert since we already updated
                    end;
                end;
            }
        }
    }
}