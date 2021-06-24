table 90000 "Compound Table"
{
    Caption = 'Supplemental Table', Comment = 'Tabla suplementaria';
    DrillDownPageID = "Compound List";
    LookupPageID = "Compound List";

    fields
    {
        field(1; "Code 1"; Code[20])
        {
            Caption = 'Code 1', Comment = 'Code 1';
            //TableRelation = "";
        }
        field(2; "Code 2"; Code[20])
        {
            Caption = 'Code 2', Comment = 'Code 2';
            //TableRelation = "";
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description', Comment = 'Descripción';
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