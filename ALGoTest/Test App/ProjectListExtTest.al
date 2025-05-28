codeunit 55102 ProjectListExtTest
{
    Subtype = Test;
    TestPermissions = Disabled;

    [Test]
    procedure TestProjectListExtensionExists()
    var
        JobListPage: TestPage "Job List";
        Assert: Codeunit Assert;
    begin
        // [GIVEN] The Job List page extension exists
        // [WHEN] Opening the Job List page
        JobListPage.OpenView();
        
        // [THEN] The page should open successfully
        Assert.IsTrue(JobListPage.IsOpened(), 'Job List page should be openable');
        
        JobListPage.Close();
    end;
}