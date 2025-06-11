tableextension 55004 ItemTableExt extends Item
{
    fields
    {
        field(55000; "Händlerpreis Lager-CH"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Händlerpreis Lager-CH';
        }
        field(55001; "Bestand Lager-CH"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Bestand Lager-CH';
        }
    }
}