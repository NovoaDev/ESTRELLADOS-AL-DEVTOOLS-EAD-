codeunit 50100 "Replace Report Mgmt."
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"ReportManagement", 'OnAfterSubstituteReport', '', false, false)]
    local procedure OnAfterSubstituteReport(ReportId: Integer; var NewReportId: Integer)
    var
        ReportSubstitution: Record "Replace Report";
    begin
        if not ReportSubstitution.Get(ReportId) then
            exit;

        NewReportId := ReportSubstitution."New Report ID";
    end;
}