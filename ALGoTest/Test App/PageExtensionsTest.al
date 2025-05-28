codeunit 55100 PageExtensionsTest
{
    Subtype = Test;
    TestPermissions = Disabled;

    var
        Assert: Codeunit Assert;
        LibraryVariableStorage: Codeunit "Library - Variable Storage";

    [Test]
    procedure TestVendorListExtensionMessage()
    var
        VendorListPage: TestPage "Vendor List";
    begin
        // [GIVEN] The Vendor List page extension exists
        // [WHEN] Opening the Vendor List page
        LibraryVariableStorage.Clear();
        VendorListPage.OpenView();
        
        // [THEN] The "Hello Welt" message should be displayed
        Assert.AreEqual('App published: Hello Welt', LibraryVariableStorage.DequeueText(), 'Wrong message displayed for Vendor List');
        
        VendorListPage.Close();
    end;

    [Test]
    procedure TestItemListExtensionMessage()
    var
        ItemListPage: TestPage "Item List";
    begin
        // [GIVEN] The Item List page extension exists
        // [WHEN] Opening the Item List page
        LibraryVariableStorage.Clear();
        ItemListPage.OpenView();
        
        // [THEN] The "Hello Welt" message should be displayed
        Assert.AreEqual('App published: Hello Welt', LibraryVariableStorage.DequeueText(), 'Wrong message displayed for Item List');
        
        ItemListPage.Close();
    end;

    [Test]
    procedure TestProjectListExtensionMessage()
    var
        JobListPage: TestPage "Job List";
    begin
        // [GIVEN] The Project List (Job List) page extension exists
        // [WHEN] Opening the Job List page
        LibraryVariableStorage.Clear();
        JobListPage.OpenView();
        
        // [THEN] The "Hello Welt" message should be displayed
        Assert.AreEqual('App published: Hello Welt', LibraryVariableStorage.DequeueText(), 'Wrong message displayed for Project List');
        
        JobListPage.Close();
    end;

    [MessageHandler]
    procedure MessageHandler(Message: Text[1024])
    begin
        LibraryVariableStorage.Enqueue(Message);
    end;
}