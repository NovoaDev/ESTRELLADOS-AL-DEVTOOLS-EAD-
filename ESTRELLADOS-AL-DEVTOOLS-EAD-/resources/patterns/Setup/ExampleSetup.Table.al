table 50000 "Example Setup"
{

    fields
    {
        field(1; "Primary Key"; Code[1])
        {
            Caption = 'Primary Key', Comment = 'Clave primaria';
            DataClassification = CustomerContent;
        }
        field(2; "Example Enabled"; Boolean)
        {
            Caption = 'Example Enabled', Comment = 'Ejemplo booleano';
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

    procedure InitSetupRecord();
    begin
        If not Get() then begin
            Init();
            Insert();
        end;
    end;
}