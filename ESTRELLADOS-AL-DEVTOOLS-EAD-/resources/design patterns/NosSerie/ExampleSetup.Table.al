table 50001 "Example Setup"
{
    Access = Internal;

    fields
    {
        field(1; "Primary Key"; Code[1])
        {
            Caption = 'Primary Key', Comment = 'ESP="Clave primaria"';
            DataClassification = CustomerContent;
        }
        //Copiar a objeto
        field(2; "Example Nos."; Code[20])
        {
            Caption = 'Example Nos.', Comment = 'ESP="Serie ejemplo"';
            TableRelation = "No. Series";
        }
        //Copiar a objeto
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}