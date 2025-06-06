// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 55000 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message(HelloWorldLbl);
    end;

    var
        HelloWorldLbl: Label 'App published: Hello World', Comment = 'Message displayed when opening Customer List page';
}

