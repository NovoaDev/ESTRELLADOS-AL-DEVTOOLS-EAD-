table 90000 "Master Example"
{
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code', Comment = 'ESP="Código"';
        }
        //Copiar a objeto
        field(2; "Contact No."; Code[20])
        {
            Caption = 'Contact No.', Comment = 'ESP="Contacto"';
            TableRelation = Contact;

            trigger OnLookup()
            var
                Contact: Record Contact;
                ContactBusinessRelation: Record "Contact Business Relation";
            begin
                if "Contact No." <> '' then
                    if Contact.Get("Contact No.") then
                        Contact.SetRange("Company No.", Contact."Company No.")
                    else
                        if ContactBusinessRelation.FindByRelation(ContactBusinessRelation."Link to Table"::Customer, "Contact No.") then
                            Contact.SetRange("Company No.", ContactBusinessRelation."Contact No.")
                        else
                            Contact.SetRange("No.", '');

                if "Contact No." <> '' then
                    if Contact.Get("Contact No.") then;
                if PAGE.RunModal(0, Contact) = ACTION::LookupOK then begin
                    xRec := Rec;
                    Validate("Contact No.", Contact."No.");
                end;
            end;

            trigger OnValidate()
            var
                Contact: Record Contact;
            begin
                Contact.Reset();
                if "Contact No." = xRec."Contact No." then
                    exit;

                if "Contact No." <> '' then
                    if Contact.Get("Contact No.") then
                        Contact.CheckIfPrivacyBlockedGeneric();
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
}