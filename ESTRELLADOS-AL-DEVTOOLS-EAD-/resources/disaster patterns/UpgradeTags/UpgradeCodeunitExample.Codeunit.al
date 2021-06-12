codeunit 50000 "Upgrade Codeunit Example"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    begin
        UpgradeFeatures();
    end;

    local procedure UpgradeFeatures()
    var
        UpgradeTag: Codeunit "Upgrade Tag";
        UpgradetagsExample: Codeunit "Upgrade tags Example";
    begin
        if UpgradeTag.HasUpgradeTag(UpgradetagsExample.GetUpgradeTagEjemplo2()) then
            exit;

        if NOT UpgradeTag.HasUpgradeTag(UpgradetagsExample.GetUpgradeTagEjemplo1()) then begin
            UpgradetagsExample.RunUpgradeEjemplo1();
            UpgradeTag.SetUpgradeTag(UpgradetagsExample.GetUpgradeTagEjemplo1());
        end;

        UpgradetagsExample.RunUpgradeEjemplo2();
        UpgradeTag.SetUpgradeTag(UpgradetagsExample.GetUpgradeTagEjemplo2());
    end;
}