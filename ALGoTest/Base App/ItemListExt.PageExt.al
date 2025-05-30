pageextension 55002 ItemListExt extends "Item List"
{
    trigger OnOpenPage();
    begin
        Message(HelloWorldLbl);
    end;

    var
        HelloWorldLbl: Label 'App published: Hello World', Comment = 'Message displayed when opening Item List page';
}