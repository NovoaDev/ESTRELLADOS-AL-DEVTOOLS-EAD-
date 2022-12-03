table 90000 "Subsidiary Table"
{
    Caption = 'Subsidiary Table', Comment = 'ESP="Tabla Subsidiaria"';
    LookupPageId = "Subsidiary Page";
    Access = Internal;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code', Comment = 'ESP="Código"';
            NotBlank = true;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.', Comment = 'ESP="Línea"';
        }
        field(3; "Subsidiary No."; Text[100])
        {
            Caption = 'Subsidiary No.', Comment = 'ESP="Nº campo Subsidiaria"';
        }
        field(4; Blocked; Boolean)
        {
            Caption = 'Blocked', Comment = 'ESP="Bloqueado"';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    internal procedure TestBlocked()
    begin
        TestField(Blocked, false);
    end;
}