tableextension 55004 ItemTableExt extends Item
{
    fields
    {
        field(55000; "Swiss Warehouse Dealer Price"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Swiss Warehouse Dealer Price';
        }
        field(55001; "Swiss Warehouse Stock"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Swiss Warehouse Stock';
            DecimalPlaces = 0:0;
        }
    }
}