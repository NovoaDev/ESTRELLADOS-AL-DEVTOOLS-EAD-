page 50100 "Replace report"
{
    ApplicationArea = All;
    Caption = 'Replace report', Comment = 'ESP="Sustituir report"';
    PageType = List;
    SourceTable = "Replace Report";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Original Report ID"; Rec."Report ID")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field("Report Name"; Rec."Report Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("New Report ID"; Rec."New Report ID")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field("New Report Caption"; Rec."New Report Caption")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
}