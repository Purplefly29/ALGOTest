codeunit 55101 ItemLagerCHTestTSTJTISHB
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
    procedure TestArtikelstammFieldsExist()
    var
        Item: Record Item;
    begin
        // [GIVEN] An item record
        LibraryInventory.CreateItem(Item);

        // [WHEN] Setting values for Artikelstamm fields
        Item."EAN" := '1234567890123456789';
        Item."Inventory HAUPT" := 100.0;
        Item."Description 3" := 'Test Description 3';
        Item."Shipping Rate %" := 5.5;
        Item."Duty Costs %" := 3.2;
        Item."Qty. on Sales Quote" := 25.0;
        Item."Last Purchase Date" := Today();
        Item."Assembly (Qty.) without C.Memo" := 15.0;
        Item."Asm. (UnitPrice) without C.Mem" := 45.75;
        Item."Currency Code" := 'EUR';
        Item."Direct Unit Cost" := 12.50;
        Item."Blocked2" := true;
        Item."Sum Efforts Hours" := 10.5;
        Item."Sum Efforts LT" := 2.5;
        Item.Modify();

        // [THEN] The values should be persisted correctly
        Item.Get(Item."No.");
        Assert.AreEqual('1234567890123456789', Item."EAN", 'EAN field not working correctly');
        Assert.AreEqual(100.0, Item."Inventory HAUPT", 'Inventory HAUPT field not working correctly');
        Assert.AreEqual('Test Description 3', Item."Description 3", 'Description 3 field not working correctly');
        Assert.AreEqual(5.5, Item."Shipping Rate %", 'Shipping Rate % field not working correctly');
        Assert.AreEqual(3.2, Item."Duty Costs %", 'Duty Costs % field not working correctly');
        Assert.AreEqual(25.0, Item."Qty. on Sales Quote", 'Qty. on Sales Quote field not working correctly');
        Assert.AreEqual(Today(), Item."Last Purchase Date", 'Last Purchase Date field not working correctly');
        Assert.AreEqual(15.0, Item."Assembly (Qty.) without C.Memo", 'Assembly Qty field not working correctly');
        Assert.AreEqual(45.75, Item."Asm. (UnitPrice) without C.Mem", 'Assembly UnitPrice field not working correctly');
        Assert.AreEqual('EUR', Item."Currency Code", 'Currency Code field not working correctly');
        Assert.AreEqual(12.50, Item."Direct Unit Cost", 'Direct Unit Cost field not working correctly');
        Assert.AreEqual(true, Item."Blocked2", 'Blocked2 field not working correctly');
        Assert.AreEqual(10.5, Item."Sum Efforts Hours", 'Sum Efforts Hours field not working correctly');
        Assert.AreEqual(2.5, Item."Sum Efforts LT", 'Sum Efforts LT field not working correctly');
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
                     '<verkaufspreishaendlerlagerch>28.00</verkaufspreishaendlerlagerch>' +
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