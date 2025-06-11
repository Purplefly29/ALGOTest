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
                begin
                    Item.SetRange("No.", Item."No.");
                    if not Item.FindFirst() then
                        currXMLport.Skip();
                end;
            }
        }
    }
}