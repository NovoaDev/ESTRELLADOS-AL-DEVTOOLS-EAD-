page 50000 "Page Example"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "Master example";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                //Copiar a objeto
                field(Description; Rec."Description")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                    end;
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    Visible = false;
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                }
                //Copiar a objeto
            }
        }
    }
}
