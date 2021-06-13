table 50000 "Master Example"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        //Copiar a objeto
        field(2; Blocked; Boolean)
        {
            Caption = 'Blocked', Comment = 'Bloqueado';
            DataClassification = CustomerContent;
        }
        //Copiar a objeto
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    //Copiar a objeto
    internal procedure TestBlocked()
    var
        BlockedErr: Label 'The %1 register is locked.', Comment = 'El registro %1 se encuentra bloqueado.';
    begin
        if Blocked then
            Error(BlockedErr, "No.");
    end;
    //Copiar a objeto
}