page 50150 "My Header API"
{
    PageType = API;

    SourceTable = "My Header";
    APIPublisher = 'kej';
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
            field(id; SystemId)
            {

            }
            field(headerNo; "No.")
            {

            }
            field(description; Description)
            {

            }
            part(headerslines; MyAPILines)
            {
                EntitySetName = 'headerslines';
                EntityName = 'headersline';
                SubPageLink = "Header Id" = field(SystemId);
            }
        }
    }
}