page 50000 "Page Example"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "Master Example";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            //Copiar a objeto
            field("No."; Rec."No.")
            {
                ApplicationArea = All;
                Importance = Standard;

                trigger OnAssistEdit()
                begin
                    if Rec.NosSeriesAssistEdit(xRec) then
                        CurrPage.Update();
                end;
            }
            //Copiar a objeto
        }
    }
}