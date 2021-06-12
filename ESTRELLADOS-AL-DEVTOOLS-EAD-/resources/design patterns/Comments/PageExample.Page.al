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
            group(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                //Copiar a objeto
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                }
                //Copiar a objeto
            }
        }
    }

    actions
    {
        area(Processing)
        {
            //Copiar a objeto
            action(Comments)
            {
                ApplicationArea = Comments;
                Caption = 'Comments', Comment = 'Comentarios';
                Image = ViewComments;
                Promoted = true;
                RunObject = Page "Comment Sheet";
                RunPageLink = "Table Name" = const(Example),
                                  "No." = field("No.");
            }
            //Copiar a objeto
        }
    }
}