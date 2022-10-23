page 90000 "Supplemental Page"
{
    ApplicationArea = All;
    Caption = 'Supplemental Page', Comment = 'ESP="Pagina suplementaria"';
    PageType = List;
    SourceTable = "Supplemental Table";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field("Supplemental No."; Rec."Supplemental No.")
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