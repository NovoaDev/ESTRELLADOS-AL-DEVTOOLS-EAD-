table 90000 "Master Example"
{
    Caption = 'Master Example', comment = 'ESP="Ejemplo maestros"';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    GetExampleSetup();
                    NoSeriesManagement.TestManual(ExampleSetup."Example Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Name"; Text[100])
        {
            Caption = 'Name', Comment = 'ESP="Nombre"';

            trigger OnValidate()
            begin
                if ("Search Name" = UpperCase(xRec.Name)) or ("Search Name" = '') then
                    "Search Name" := CopyStr(Name, 1, MaxStrLen("Search Name"));
            end;
        }
        field(3; "Name 2"; Text[50])
        {
            Caption = 'Name 2', Comment = 'ESP="Nombre 2"';
        }
        field(4; "Search Name"; Code[100])
        {
            Caption = 'Search Name', Comment = 'ESP="Nombre para busqueda"';
        }
        field(5; "No. Series"; Code[20])
        {
            Caption = 'No. Series', Comment = 'ESP="Nº Serie"';
            Editable = false;
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Search Name")
        {
        }
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            TestExampleNoSeries();
            NoSeriesManagement.InitSeries(ExampleSetup."Example Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    local procedure GetExampleSetup()
    begin
        if not ExampleSetupRead then
            ExampleSetup.Get();

        ExampleSetupRead := true;
    end;

    local procedure TestExampleNoSeries()
    begin
        GetExampleSetup();
        ExampleSetup.TestField("Example Nos.");
    end;

    procedure NosSeriesAssistEdit(OldMasterExample: Record "Master Example"): Boolean
    var
        MasterExample: Record "Master Example";
    begin
        MasterExample := Rec;
        TestExampleNoSeries();
        if NoSeriesManagement.SelectSeries(ExampleSetup."Example Nos.", OldMasterExample."No. Series", MasterExample."No. Series") then begin
            TestExampleNoSeries();
            NoSeriesManagement.SetSeries(MasterExample."No.");
            Rec := MasterExample;
            exit(true);
        end;
    end;

    var
        ExampleSetup: Record "Example Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        ExampleSetupRead: Boolean;
}