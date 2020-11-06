page 50150 "My Header API"
{
    PageType = API;
    SourceTable = "My Header";
    APIPublisher = 'ajk';
    APIGroup = 'demo';
    APIVersion = 'v1.0';
    EntitySetName = 'headers';
    EntityName = 'header';
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            field(id; SystemId) { }
            field(headerNo; "No.") { }
            field(description; Description) { }
            part(lines; MyAPILines)
            {
                EntitySetName = 'lines';
                EntityName = 'line';
                SubPageLink = "Header Id" = field(SystemId);
            }
        }
    }
}