table 50000 "Master Example"
{
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code', Comment = 'Codigo';
        }
        //Copiar a objeto
        field(2; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code', Comment = 'Código vendedor';
            TableRelation = "Salesperson/Purchaser";

            trigger OnValidate()
            begin
                ValidateSalesPersonCode();
            end;
        }
        //Copiar a objeto
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }
    //Copiar a objeto
    local procedure ValidateSalesPersonCode()
    var
        SalespersonPurchaser: Record "Salesperson/Purchaser";
    begin
        if "Salesperson Code" <> '' then
            if SalespersonPurchaser.Get("Salesperson Code") then
                if SalespersonPurchaser.VerifySalesPersonPurchaserPrivacyBlocked(SalespersonPurchaser) then
                    Error(SalespersonPurchaser.GetPrivacyBlockedGenericText(SalespersonPurchaser, true));
    end;
    //Copiar a objeto
}