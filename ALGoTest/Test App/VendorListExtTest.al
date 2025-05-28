codeunit 55100 VendorListExtTest
{
    Subtype = Test;
    TestPermissions = Disabled;

    [Test]
    procedure TestVendorListExtensionExists()
    var
        VendorListPage: TestPage "Vendor List";
        Assert: Codeunit Assert;
    begin
        // [GIVEN] The Vendor List page extension exists
        // [WHEN] Opening the Vendor List page
        VendorListPage.OpenView();
        
        // [THEN] The page should open successfully
        Assert.IsTrue(VendorListPage.IsOpened(), 'Vendor List page should be openable');
        
        VendorListPage.Close();
    end;
}