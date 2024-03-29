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
                field(GlobalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field(GlobalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                }
                //Copiar a objeto
            }
        }
        //Copiar a objeto
        area(factboxes)
        {
            part(ControlDimension; "Dimensions FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "Table ID" = const(50000),
                              "No." = field("No.");
            }
        }
        //Copiar a objeto
    }

    actions
    {
        area(Processing)
        {
            //Copiar a objeto
            action(Dimensions)
            {
                ApplicationArea = Dimensions;
                Caption = 'Dimensions', Comment = 'ESP="Dimensiones"';
                Image = Dimensions;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Default Dimensions";
                RunPageLink = "Table ID" = CONST(50000),
                                  "No." = FIELD("No.");
                ShortCutKey = 'Alt+D';
            }
            //Copiar a objeto
        }
    }
}