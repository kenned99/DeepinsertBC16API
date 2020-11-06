page 50153 "MyAPILines"
{
    PageType = ListPart;
    SourceTable = "My Line";
    DelayedInsert = true;
    AutoSplitKey = true;
    PopulateAllFields = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(lines)
            {

                field(headerNo; "Header No.")
                {
                    ApplicationArea = all;
                }
                field("Header Id"; "Header Id")
                {
                    ApplicationArea = all;
                }
                field(lineNo; "Line No.")
                {
                    ApplicationArea = all;
                }
                field(description; Description)
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    var
        IsDeepInsert: Boolean;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        MyHeader: Record "My Header";
        MyLine: Record "My Line";
    begin
        if IsDeepInsert then begin
            MyHeader.GetBySystemId("Header Id");
            "Header No." := MyHeader."No.";
            MyLine.SetRange("Header No.", "Header No.");
            if MyLine.FindLast() then
                "Line No." := MyLine."Line No." + 10000
            else
                "Line No." := 10000;
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        MyHeader: Record "My Header";
    begin
        IsDeepInsert := IsNullGuid("Header Id");
        if not IsDeepInsert then begin
            MyHeader.GetBySystemId("Header Id");
            "Header No." := MyHeader."No.";
        end;
    end;
}