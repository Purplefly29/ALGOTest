pageextension 55001 VendorListExt extends "Vendor List"
{
    trigger OnOpenPage();
    begin
        Message(HelloWorldLbl);
    end;

    var
        HelloWorldLbl: Label 'App published: Hello Welt', Comment = 'Message displayed when opening Vendor List page';
}