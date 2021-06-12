table 50000 "Master example"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;

        }
        //Copiar a objeto
        field(2; "Description"; Text[100])
        {
            Caption = 'Description';

            trigger OnValidate()
            begin
                if ("Search Description" = UpperCase(xRec.Description)) or ("Search Description" = '') then
                    "Search Description" := CopyStr(Description, 1, MaxStrLen("Search Description"));
            end;
        }
        field(3; "Search Description"; Code[100])
        {
            Caption = 'Search Description';
        }
        field(4; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
        }
        //Copiar a objeto
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        //Copiar a objeto
        key(Key2; "Search Description") { }
        //Copiar a objeto
    }
}