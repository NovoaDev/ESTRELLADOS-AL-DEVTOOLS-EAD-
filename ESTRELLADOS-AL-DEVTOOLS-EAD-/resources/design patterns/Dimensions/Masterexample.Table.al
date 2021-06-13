table 50000 "Master Example"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.', Comment = 'Nº';
        }
        //Copiar a objeto
        field(2; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code', Comment = 'Codigo dimensión global 1';
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimensionCode(1, "Global Dimension 1 Code");
            end;
        }
        field(3; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code', Comment = 'Codigo dimensión global 2';
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimensionCode(2, "Global Dimension 2 Code");
            end;
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
        DimensionManagement.UpdateDefaultDim(Database::"Master Example", "No.", "Global Dimension 1 Code", "Global Dimension 2 Code");
    end;

    trigger OnDelete()
    begin
        DimensionManagement.DeleteDefaultDim(Database::"Master Example", "No.");
    end;

    procedure ValidateShortcutDimensionCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimensionManagement.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        if not IsTemporary then begin
            DimensionManagement.SaveDefaultDim(Database::"Master Example", "No.", FieldNumber, ShortcutDimCode);
            Modify(true);
        end;
    end;

    var
        DimensionManagement: Codeunit DimensionManagement;
    //Copiar a objeto
}