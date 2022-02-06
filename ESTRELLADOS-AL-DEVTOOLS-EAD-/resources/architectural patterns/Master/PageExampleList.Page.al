page 90001 "Page Example List"
{
    ApplicationArea = All;
    Caption = 'Master Example', comment = 'ESP="Ejemplo maestros"';
    CardPageId = "Page Example";
    Editable = false;
    PageType = List;
    SourceTable = "Master Example";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}