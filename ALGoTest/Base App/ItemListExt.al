pageextension 55002 ItemListExt extends "Item List"
{
    trigger OnOpenPage();
    begin
        Message('App published: Hello Welt');
    end;
}