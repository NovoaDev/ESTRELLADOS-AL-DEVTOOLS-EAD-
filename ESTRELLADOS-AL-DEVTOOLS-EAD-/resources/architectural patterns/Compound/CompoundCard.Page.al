page 90001 "Compound Card"
{
    Caption = 'Compound Card', Comment = 'Pagina patrón compuesto';
    PageType = Card;
    SourceTable = "Compound Table";

    layout
    {
        area(Content)
        {
            group(Compound)
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