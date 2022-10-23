table 50101 "ANJ_Example Table Map"
{
    Caption = 'Vehicles', comment = 'ESP="Vehiculos"';
    ExternalName = 'Vehiculos';
    ExternalSchema = 'dbo';
    TableType = ExternalSQL;

    fields
    {
        field(1; "ANJ_Entry No."; Code[20])
        {
            Caption = 'Entry No.', comment = 'ESP="Movimientos"';
            DataClassification = CustomerContent;
        }
        field(2; ANJ_Matricula; Code[20])
        {
            Caption = 'Matriculing', comment = 'ESP="Matricula"';
            DataClassification = CustomerContent;
            ExternalName = 'Matricula';
            SqlDataType = Varchar;
        }
    }

    keys
    {
        key(Key1; "ANJ_Entry No.")
        {
            Clustered = true;
        }
    }
}