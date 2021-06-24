page 90000 "Page Example"
{
    ApplicationArea = All;
    PageType = Card;
    SourceTable = "Master Example";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                //Copiar a objeto
                field(Name; Rec."Name")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord();
                    end;
                }
                field("Name 2"; Rec."Name 2")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    Visible = false;
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                }
                //Copiar a objeto
            }
        }
    }
}