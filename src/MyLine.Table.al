table 50151 "My Line"
{
    fields
    {
        field(1; "Header No."; Code[20])
        {
            TableRelation = "My Header"."No.";
        }
        field(2; "Line No."; Integer)
        {

        }
        field(3; "Header Id"; Guid)
        {
            TableRelation = "My Header".SystemId;
        }
        field(4; Description; Text[50])
        {
            trigger OnValidate()
            begin
                CheckHeaderStatus();
            end;
        }
    }

    keys
    {
        key(PK; "Header No.", "Line No.")
        {
            Clustered = true;
        }
    }

    var
        MyHeader: Record "My Header";

    local procedure CheckHeaderStatus()
    begin
        GetHeader();
    end;

    local procedure GetHeader()
    begin
        if MyHeader.SystemId <> "Header Id" then
            MyHeader.GetBySystemId("Header Id");
    end;
}

/*table 50151 "My Line"
{
    fields
    {
        field(1; "Header No."; Code[20])
        {
            TableRelation = "My Header"."No.";
        }
        field(2; "Line No."; Integer) { }
        field(3; "Header Id"; Guid)
        {
            TableRelation = "My Header".SystemId;
        }
        field(4; Description; Text[50])
        {
        }
    }

    keys
    {
        key(PK; "Header No.", "Line No.") { }
    }
}*/
