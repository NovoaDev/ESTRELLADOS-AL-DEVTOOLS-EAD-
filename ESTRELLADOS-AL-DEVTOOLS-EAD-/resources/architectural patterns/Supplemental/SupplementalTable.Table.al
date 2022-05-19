table 90000 "Supplemental Table"
{
    Caption = 'Supplemental Table', Comment = 'ESP="Tabla suplementaria"';
    LookupPageId = "Supplemental Page";
    Access = Internal;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code', Comment = 'ESP="Código"';
            NotBlank = true;
        }
        field(2; "Supplemental No."; Code[20])
        {
            Caption = 'Supplemental No.', Comment = 'ESP="Nº campo suplementario"';
        }
        field(3; Blocked; Boolean)
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