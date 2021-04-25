page 50000 "Example Setup"
{
    ApplicationArea = All;
    Caption = 'Example Setup', Comment = 'Ejemplo de configuración';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Example Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General', Comment = 'General';
                field("Example Enabled"; Rec."Example Enabled")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        Rec.InitSetupRecord();
    end;
}