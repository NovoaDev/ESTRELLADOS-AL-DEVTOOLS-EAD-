table 50000 "Master Example"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.', Comment = 'ESP="Nº"';
            DataClassification = CustomerContent;
        }

        //Copiar a objeto
        field(2; Comment; Boolean)
        {
            CalcFormula = Exist("Comment Line" where("Table Name" = const(Example), "No." = field("No.")));
            Caption = 'Comment', Comment = 'ESP="Comentarios"';
            Editable = false;
            FieldClass = FlowField;
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

    //Copiar a objeto integridad refenrencial 
    trigger OnDelete()
    var
        CommentLine: Record "Comment Line";
    begin
        CommentLine.SetRange("Table Name", CommentLine."Table Name"::Example);
        CommentLine.SetRange("No.", "No.");
        CommentLine.DeleteAll();
    end;
    //Copiar a objeto
}