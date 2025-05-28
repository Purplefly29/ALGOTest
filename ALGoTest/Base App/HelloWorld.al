// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 55000 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message('App published: Hello Welt');
    end;
}

pageextension 55001 VendorListExt extends "Vendor List"
{
    trigger OnOpenPage();
    begin
        Message('App published: Hello Welt');
    end;
}

pageextension 55002 ItemListExt extends "Item List"
{
    trigger OnOpenPage();
    begin
        Message('App published: Hello Welt');
    end;
}

pageextension 55003 ProjectListExt extends "Job List"
{
    trigger OnOpenPage();
    begin
        Message('App published: Hello Welt');
    end;
}

