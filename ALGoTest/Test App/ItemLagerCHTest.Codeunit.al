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
        Item."Händlerpreis Lager-CH" := 28.00;
        Item."Bestand Lager-CH" := 45.00;
        Item.Modify();

        // [THEN] The values should be persisted correctly
        Item.Get(Item."No.");
        Assert.AreEqual(28.00, Item."Händlerpreis Lager-CH", 'Händlerpreis Lager-CH field not working correctly');
        Assert.AreEqual(45.00, Item."Bestand Lager-CH", 'Bestand Lager-CH field not working correctly');
    end;

    [Test]
    procedure TestItemCardExtensionFieldsVisible()
    var
        Item: Record Item;
        ItemCardPage: TestPage "Item Card";
    begin
        // [GIVEN] An item exists
        LibraryInventory.CreateItem(Item);
        
        // [WHEN] Opening the Item Card page
        ItemCardPage.OpenView();
        ItemCardPage.Filter.SetFilter("No.", Item."No.");
        
        // [THEN] The Lager-CH fields should be accessible
        // Note: "Händlerpreis Lager-CH" has Visible = false, so we only test if it exists
        // "Bestand Lager-CH" should be visible and accessible
        ItemCardPage."Bestand Lager-CH".SetValue(45.00);
        Assert.AreEqual('45', ItemCardPage."Bestand Lager-CH".Value, 'Bestand Lager-CH field not accessible on Item Card');
        
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
        Assert.AreEqual(45.00, Item."Bestand Lager-CH", 'XMLport import failed for Bestand Lager-CH');
        Assert.AreEqual(28.00, Item."Händlerpreis Lager-CH", 'XMLport import failed for Händlerpreis Lager-CH');
    end;
}