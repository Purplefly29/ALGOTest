codeunit 55101 ItemListExtTest
{
    Subtype = Test;
    TestPermissions = Disabled;

    [Test]
    procedure TestItemListExtensionExists()
    var
        ItemListPage: TestPage "Item List";
        Assert: Codeunit Assert;
    begin
        // [GIVEN] The Item List page extension exists
        // [WHEN] Opening the Item List page
        ItemListPage.OpenView();
        
        // [THEN] The page should open successfully
        Assert.IsTrue(ItemListPage.IsOpened(), 'Item List page should be openable');
        
        ItemListPage.Close();
    end;
}