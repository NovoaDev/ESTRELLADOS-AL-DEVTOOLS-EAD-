table 50100 "Replace Report"
{
    Caption = 'Replace report', Comment = 'ESP="Sustituir report"';
    DataClassification = CustomerContent;
    DrillDownPageId = "Replace Report";
    LookupPageId = "Replace Report";
    Access = Internal;

    fields
    {
        field(1; "Report ID"; Integer)
        {
            BlankZero = true;
            Caption = 'Report ID', Comment = 'ESP="ID Report"';
            DataClassification = CustomerContent;
            TableRelation = AllObjWithCaption."Object ID" where("Object Type" = const(Report));
        }
        field(10; "Report Name"; Text[250])
        {
            CalcFormula = lookup(AllObjWithCaption."Object Caption" where("Object Type" = const(Report), "Object ID" = field("Report ID")));
            Caption = 'Name', Comment = 'ESP="Nombre"';
            FieldClass = FlowField;
        }
        field(20; "New Report ID"; Integer)
        {
            BlankZero = true;
            Caption = 'New Report ID', Comment = 'ESP="Nuevo ID Report"';
            DataClassification = CustomerContent;
            TableRelation = AllObjWithCaption."Object ID" where("Object Type" = const(Report));
        }
        field(30; "New Report Caption"; Text[249])
        {
            CalcFormula = lookup(AllObjWithCaption."Object Caption" where("Object Type" = const(Report), "Object ID" = field("New Report ID")));
            Caption = 'Name', Comment = 'ESP="Nombre"';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(PK; "Report ID")
        {
            Clustered = true;
        }
    }
}