table 50100 "ANJ_External Config"
{
    Access = Internal;
    Caption = 'External Sql Configuration', Comment = 'ESP="Configuración SQL Externo"';
    DrillDownPageID = "ANJ_External Config";
    LookupPageID = "ANJ_External Config";
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key', Comment = 'ESP="Clave primaria"';
            DataClassification = CustomerContent;
        }
        field(2; Server; Text[250])
        {
            Caption = 'Server', Comment = 'ESP="Servidor"';
            DataClassification = CustomerContent;
        }
        field(3; "Sql Intance"; Text[250])
        {
            Caption = 'Sql Intence', Comment = 'ESP="Instancia SQL"';
            DataClassification = CustomerContent;
        }
        field(4; "Sql Database"; Text[250])
        {
            Caption = 'Sql Database', Comment = 'ESP="Base de datos SQL"';
            DataClassification = CustomerContent;
        }
        field(5; "Sql User"; Text[250])
        {
            Caption = 'Sql User', Comment = 'ESP="Usuario SQL"';
            DataClassification = CustomerContent;
        }
        field(6; "Sql Password"; Text[250])
        {
            Caption = 'Sql Password', Comment = 'ESP="Clave SQL"';
            DataClassification = CustomerContent;
            ExtendedDatatype = Masked;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    internal procedure GetRecord();
    begin
        if HasBeenRead then
            exit;

        If not Rec.Get() then begin
            Rec.Init();
            Rec.Insert(true);
        end;
        HasBeenRead := true;
    end;

    var
        HasBeenRead: Boolean;
}
