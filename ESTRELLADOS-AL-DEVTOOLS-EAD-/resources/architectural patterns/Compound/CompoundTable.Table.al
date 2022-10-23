table 90000 "Compound Table"
{
    Access = Internal;
    Caption = 'Supplemental Table', Comment = 'ESP="Tabla suplementaria"';
    DrillDownPageID = "Compound List";
    LookupPageID = "Compound List";

    fields
    {
        field(1; "Code 1"; Code[20])
        {
            Caption = 'Code 1', Comment = 'ESP="Code 1"';
            //TableRelation = "";
        }
        field(2; "Code 2"; Code[20])
        {
            Caption = 'Code 2', Comment = 'ESP="Code 2"';
            //TableRelation = "";
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description', Comment = 'ESP="Descripción"';
        }
    }

    keys
    {
        key(Key1; "Code 1", "Code 2")
        {
            Clustered = true;
        }
    }
}