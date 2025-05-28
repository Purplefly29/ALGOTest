pageextension 55001 VendorListExt extends "Vendor List"
{
    trigger OnOpenPage();
    begin
        Message('App published: Hello Welt');
    end;
}