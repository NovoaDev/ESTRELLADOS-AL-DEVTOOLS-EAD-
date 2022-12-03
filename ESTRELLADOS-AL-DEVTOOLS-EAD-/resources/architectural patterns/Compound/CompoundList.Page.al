page 90000 "Compound List"
{
    ApplicationArea = All;
    Caption = 'Compound List', Comment = 'ESP="Pagina patrón compuesto"';
    CardPageID = "Compound Card";
    PageType = List;
    SourceTable = "Compound Table";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Code 1"; Rec."Code 1")
                {
                    ApplicationArea = All;
                }
                field("Code 2"; Rec."Code 2")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}