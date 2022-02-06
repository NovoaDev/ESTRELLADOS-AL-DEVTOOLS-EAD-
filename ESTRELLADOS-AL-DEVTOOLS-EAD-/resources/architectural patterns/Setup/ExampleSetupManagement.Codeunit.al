codeunit 50000 "Example Setup Management"
{
    internal procedure GetExampleEnabled(): Boolean
    begin
        ExampleSetup.GetInstance();
        exit(ExampleSetup."Example Enabled");
    end;

    var
        ExampleSetup: Record "Example Setup";
}