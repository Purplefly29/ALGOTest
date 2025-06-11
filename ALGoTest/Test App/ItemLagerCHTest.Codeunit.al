codeunit 55101 ItemLagerCHTest
{
    Subtype = Test;
    TestPermissions = Disabled;

    var
        Assert: Codeunit Assert;
        LibraryInventory: Codeunit "Library - Inventory";

    [Test]
    procedure TestItemLagerCHFieldsExist()
    var
        Item: Record Item;
    begin
        // [GIVEN] An item record
        LibraryInventory.CreateItem(Item);

        // [WHEN] Setting values for Lager-CH fields
        Item."Swiss Warehouse Dealer Price" := 28.00;
        Item."Swiss Warehouse Stock" := 45.00;
        Item.Modify();

        // [THEN] The values should be persisted correctly
        Item.Get(Item."No.");
        Assert.AreEqual(28.00, Item."Swiss Warehouse Dealer Price", 'Swiss Warehouse Dealer Price field not working correctly');
        Assert.AreEqual(45.00, Item."Swiss Warehouse Stock", 'Swiss Warehouse Stock field not working correctly');
    end;

    [Test]
    procedure TestItemCardExtensionFieldsVisible()
    var
        Item: Record Item;
        ItemCardPage: TestPage "Item Card";
    begin
        // [GIVEN] An item exists with Swiss warehouse data
        LibraryInventory.CreateItem(Item);
        Item."Swiss Warehouse Stock" := 45.00;
        Item."Swiss Warehouse Dealer Price" := 28.00;
        Item.Modify();
        
        // [WHEN] Opening the Item Card page
        ItemCardPage.OpenEdit();
        ItemCardPage.GoToRecord(Item);
        
        // [THEN] The Lager-CH fields should be accessible and display the correct values
        // "Swiss Warehouse Stock" should be visible and display the value (read-only)
        Assert.AreEqual('45', ItemCardPage."Swiss Warehouse Stock".Value, 'Swiss Warehouse Stock field not displaying correctly on Item Card');
        
        ItemCardPage.Close();
    end;

    [Test]
    procedure TestXMLPortImport()
    var
        Item: Record Item;
        ItemLagerCHImport: XMLport "Item Lager-CH Import";
        XMLContent: Text;
        TempBlob: Codeunit "Temp Blob";
        InStream: InStream;
        OutStream: OutStream;
    begin
        // [GIVEN] An item exists and XML content
        LibraryInventory.CreateItem(Item);
        XMLContent := '<?xml version="1.0" encoding="UTF-8"?>' +
                     '<Root>' +
                     '<Item>' +
                     '<nummer>' + Item."No." + '</nummer>' +
                     '<bestandlagerch>45</bestandlagerch>' +
                     '<verkaufspreishändlerlagerch>28.00</verkaufspreishändlerlagerch>' +
                     '</Item>' +
                     '</Root>';

        // [WHEN] Importing via XMLport
        TempBlob.CreateOutStream(OutStream);
        OutStream.WriteText(XMLContent);
        TempBlob.CreateInStream(InStream);
        
        ItemLagerCHImport.SetSource(InStream);
        ItemLagerCHImport.Import();

        // [THEN] The item should have updated values
        Item.Get(Item."No.");
        Assert.AreEqual(45.00, Item."Swiss Warehouse Stock", 'XMLport import failed for Swiss Warehouse Stock');
        Assert.AreEqual(28.00, Item."Swiss Warehouse Dealer Price", 'XMLport import failed for Swiss Warehouse Dealer Price');
    end;
}