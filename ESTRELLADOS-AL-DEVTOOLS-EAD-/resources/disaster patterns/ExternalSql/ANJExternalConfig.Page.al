page 50100 "ANJ_External Config"
{
    ApplicationArea = All;
    Caption = 'External Sql Configuration', Comment = 'ESP="Configuración SQL Externo"';
    PageType = Card;
    SourceTable = "ANJ_External Config";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Server; Rec.Server)
                {
                    ApplicationArea = All;
                }
                field("Sql Intance"; Rec."Sql Intance")
                {
                    ApplicationArea = All;
                }
                field("Sql Database"; Rec."Sql Database")
                {
                    ApplicationArea = All;
                }
                field("Sql User"; Rec."Sql User")
                {
                    ApplicationArea = All;
                }
                field("Sql Password"; Rec."Sql Password")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}