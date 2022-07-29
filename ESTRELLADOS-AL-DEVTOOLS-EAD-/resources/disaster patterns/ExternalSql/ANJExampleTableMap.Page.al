page 50101 "ANJ_Example Table Map"
{
    ApplicationArea = All;
    Caption = 'Vehicles', comment = 'ESP="Vehiculos"';
    PageType = List;
    SourceTable = "ANJ_Example Table Map";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(ANJ_Matricula; Rec.ANJ_Matricula)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnInit()
    begin
        Codeunit.Run(Codeunit::"ANJ_Connect SQL Mgmt.");
    end;
}