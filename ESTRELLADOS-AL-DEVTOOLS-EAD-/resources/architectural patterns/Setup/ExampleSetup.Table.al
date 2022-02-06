table 50000 "Example Setup"
{
    Caption = 'Example Setup', comment = 'ESP="Ejemplo de configuración"';
    DrillDownPageID = "Example Setup";
    LookupPageID = "Example Setup";

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key', Comment = 'ESP="Clave primaria"';
            DataClassification = CustomerContent;
        }
        field(2; "Example Enabled"; Boolean)
        {
            Caption = 'Example Enabled', Comment = 'ESP="Ejemplo booleano"';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    internal procedure GetInstance();
    begin
        if HasBeenRead then
            exit;

        If not Rec.Get() then begin
            Rec.Init();
            Rec.Insert(true);
        end;
        HasBeenRead := true;
    end;

    var
        HasBeenRead: Boolean;
}