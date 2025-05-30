codeunit 55100 PageExtensionsTest
{
    Subtype = Test;
    TestPermissions = Disabled;

    var
        Assert: Codeunit Assert;
        LibraryVariableStorage: Codeunit "Library - Variable Storage";

    [Test]
    [HandlerFunctions('MessageHandler')]
    procedure TestCustomerListExtensionMessage()
    var
        CustomerListPage: TestPage "Customer List";
    begin
        // [GIVEN] The Customer List page extension exists
        // [WHEN] Opening the Customer List page
        LibraryVariableStorage.Clear();
        CustomerListPage.OpenView();

        // [THEN] The "Hello World" message should be displayed
        Assert.AreEqual('App published: Hello World', LibraryVariableStorage.DequeueText(), 'Wrong message displayed for Customer List');

        CustomerListPage.Close();
    end;

    [Test]
    [HandlerFunctions('MessageHandler')]
    procedure TestVendorListExtensionMessage()
    var
        VendorListPage: TestPage "Vendor List";
    begin
        // [GIVEN] The Vendor List page extension exists
        // [WHEN] Opening the Vendor List page
        LibraryVariableStorage.Clear();
        VendorListPage.OpenView();

        // [THEN] The "Hello World" message should be displayed
        Assert.AreEqual('App published: Hello World', LibraryVariableStorage.DequeueText(), 'Wrong message displayed for Vendor List');

        VendorListPage.Close();
    end;

    [Test]
    [HandlerFunctions('MessageHandler')]
    procedure TestItemListExtensionMessage()
    var
        ItemListPage: TestPage "Item List";
    begin
        // [GIVEN] The Item List page extension exists
        // [WHEN] Opening the Item List page
        LibraryVariableStorage.Clear();
        ItemListPage.OpenView();

        // [THEN] The "Hello World" message should be displayed
        Assert.AreEqual('App published: Hello World', LibraryVariableStorage.DequeueText(), 'Wrong message displayed for Item List');

        ItemListPage.Close();
    end;

    [Test]
    [HandlerFunctions('MessageHandler')]
    procedure TestProjectListExtensionMessage()
    var
        JobListPage: TestPage "Job List";
    begin
        // [GIVEN] The Project List (Job List) page extension exists
        // [WHEN] Opening the Job List page
        LibraryVariableStorage.Clear();
        JobListPage.OpenView();

        // [THEN] The "Hello World" message should be displayed
        Assert.AreEqual('App published: Hello World', LibraryVariableStorage.DequeueText(), 'Wrong message displayed for Project List');

        JobListPage.Close();
    end;

    [MessageHandler]
    procedure MessageHandler(Message: Text[1024])
    begin
        LibraryVariableStorage.Enqueue(Message);
    end;
}