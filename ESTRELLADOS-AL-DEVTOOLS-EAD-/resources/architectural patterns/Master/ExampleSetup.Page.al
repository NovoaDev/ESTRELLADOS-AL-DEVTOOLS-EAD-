page 90003 "Example Setup"
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
                //Copiar a objeto
                field("Example Nos."; Rec."Example Nos.")
                {
                    ApplicationArea = All;
                }
                //Copiar a objeto
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert(true);
        end;
    end;
}