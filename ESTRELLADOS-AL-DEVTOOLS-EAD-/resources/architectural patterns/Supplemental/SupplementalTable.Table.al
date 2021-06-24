table 90000 "Supplemental Table"
{
    Caption = 'Supplemental Table', Comment = 'Tabla suplementaria';
    LookupPageId = "Supplemental Page";

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code', Comment = 'Código';
            NotBlank = true;
        }
        field(2; "Supplemental No."; Code[20])
        {
            Caption = 'Supplemental No.', Comment = 'Nº campo suplementario';
        }
        field(3; Blocked; Boolean)
        {
            Caption = 'Blocked', Comment = 'Bloqueado';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    procedure TestBlocked()
    begin
        TestField(Blocked, false);
    end;
}