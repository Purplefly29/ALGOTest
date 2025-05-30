pageextension 55003 ProjectListExt extends "Job List"
{
    trigger OnOpenPage();
    begin
        Message('App published: Hello Welt');
    end;
}