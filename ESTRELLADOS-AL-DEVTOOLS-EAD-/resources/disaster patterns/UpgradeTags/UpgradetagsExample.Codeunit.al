codeunit 50001 "Upgrade tags Example"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Upgrade Tag", 'OnGetPerCompanyUpgradeTags', '', false, false)]
    local procedure RegisterPerCompanyTags(var PerCompanyUpgradeTags: List of [Code[250]])
    begin
        PerCompanyUpgradeTags.Add(GetUpgradeTagEjemplo1());
        PerCompanyUpgradeTags.Add(GetUpgradeTagEjemplo2());
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Upgrade Tag", 'OnGetPerDatabaseUpgradeTags', '', false, false)]
    local procedure RegisterPerDatabaseTags(var PerDatabaseUpgradeTags: List of [Code[250]])
    begin
        PerDatabaseUpgradeTags.Add(GetUpgradeTagPerDB());
    end;

    procedure GetUpgradeTagEjemplo1(): code[250]
    begin
        exit('EAD-427349-FixCustomer-08052020')
    end;

    procedure RunUpgradeEjemplo1()
    begin
    end;


    procedure GetUpgradeTagEjemplo2(): code[250]
    begin
        exit('EAD-5b9182-FixVendor-09052020')
    end;

    procedure RunUpgradeEjemplo2()
    var
    begin
    end;

    procedure GetUpgradeTagPerDB(): code[250]
    begin
        exit('EAD-5b2282-PerData-10052020')
    end;
}