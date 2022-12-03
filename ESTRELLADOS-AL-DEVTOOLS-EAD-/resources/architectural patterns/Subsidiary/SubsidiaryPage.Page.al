page 90000 "Subsidiary Page"
{
    ApplicationArea = All;
    Caption = 'Subsidiary Page', Comment = 'ESP="Pagina Subsidiaria"';
    PageType = List;
    SourceTable = "Subsidiary Table";
    AutoSplitKey = true;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Subsidiary No."; Rec."Subsidiary No.")
                {
                    ApplicationArea = All;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}