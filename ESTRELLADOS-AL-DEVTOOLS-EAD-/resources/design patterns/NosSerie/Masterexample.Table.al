table 50000 "Master Example"
{
    DataClassification = CustomerContent;

    fields
    {
        //Copiar a objeto
        field(1; "No."; Code[20])
        {
            Caption = 'No.', Comment = 'Nº';

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    GetExampleSetup();
                    NoSeriesManagement.TestManual(ExampleSetup."Example Nos.");
                    "No. Series" := '';
                end;
            end;
        }

        field(2; "No. Series"; Code[20])
        {
            Caption = 'No. Series', Comment = 'Nº Serie';
            Editable = false;
            TableRelation = "No. Series";
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
    //Copiar a objeto
}