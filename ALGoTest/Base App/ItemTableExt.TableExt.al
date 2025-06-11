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
        field(55002; "EAN"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'EAN';
        }
        field(55003; "Inventory HAUPT"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Lagerbestand HAUPT';
        }
        field(55008; "Description 3"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Beschreibung 3';
        }
        field(55021; "Shipping Rate %"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Frachtsatz %';
        }
        field(55022; "Duty Costs %"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Zollkosten %';
        }
        field(55027; "Qty. on Sales Quote"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Menge in Angebot';
        }
        field(55029; "Last Purchase Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Letztes Einkaufsdatum';
        }
        field(55030; "Assembly (Qty.) without C.Memo"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Montage (Menge) ohne Gutschriften';
        }
        field(55031; "Asm. (UnitPrice) without C.Mem"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Montage zum Einstandsbetrag (o. GS)';
        }
        field(55097; "Currency Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Währungscode';
        }
        field(55098; "Direct Unit Cost"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'EK-Preis';
        }
        field(55099; "Blocked2"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Blocked2';
        }
    }
}