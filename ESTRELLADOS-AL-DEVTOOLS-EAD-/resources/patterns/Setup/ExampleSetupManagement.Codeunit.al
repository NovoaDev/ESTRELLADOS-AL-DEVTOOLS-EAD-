codeunit 50000 "Example Setup Management"
{
    procedure GetExampleEnabled(): Boolean
    var
        ExampleSetup: Record "Example Setup";
    begin
        ExampleSetup.InitSetupRecord();
        exit(ExampleSetup."Example Enabled");
    end;

}