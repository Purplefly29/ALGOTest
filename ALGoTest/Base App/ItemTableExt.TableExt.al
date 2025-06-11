tableextension 55004 ItemTableExt extends Item
{
    fields
    {
        field(55000; "Swiss Warehouse Dealer Price"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Swiss Warehouse Dealer Price';
            CaptionML = ENU='Swiss Warehouse Dealer Price',
                       DEU='Händlerpreis Lager-CH',
                       ITA='Prezzo Rivenditore Magazzino CH';
        }
        field(55001; "Swiss Warehouse Stock"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Swiss Warehouse Stock';
            CaptionML = ENU='Swiss Warehouse Stock',
                       DEU='Bestand Lager-CH',
                       ITA='Giacenza Magazzino CH';
        }
    }
}