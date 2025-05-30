pageextension 55003 ProjectListExt extends "Job List"
{
    trigger OnOpenPage();
    begin
        Message(HelloWorldLbl);
    end;

    var
        HelloWorldLbl: Label 'App published: Hello World', Comment = 'Message displayed when opening Project List page';
}