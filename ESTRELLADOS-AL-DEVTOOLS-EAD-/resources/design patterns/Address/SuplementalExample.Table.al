table 50000 "Suplemental Example"
{
    fields
    {
        //Colocar  QuickEntry = false; en los campos de las paginas
        field(1; "Code"; Code[10])
        {
            Caption = 'Code', Comment = 'ESP="Código"';
            NotBlank = true;
        }
        field(2; "Address"; Text[100])
        {
            Caption = 'Address', Comment = 'ESP="Dirección"';
        }
        field(3; "Address 2"; Text[50])
        {
            Caption = 'Address 2', Comment = 'ESP="Dirección 2"';
        }
        field(4; "City"; Text[30])
        {
            Caption = 'City', Comment = 'ESP="Ciudad"';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode("City", "Post Code", "County", "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidateCity("City", "Post Code", "County", "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(5; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code', Comment = 'ESP="Código de país/región"';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                PostCode.CheckClearPostCodeCityCounty("City", "Post Code", "County", "Country/Region Code", xRec."Country/Region Code");
            end;
        }
        field(6; "Post Code"; Code[20])
        {
            Caption = 'Post Code', Comment = 'ESP="Código postal"';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code"
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode("City", "Post Code", "County", "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode("City", "Post Code", "County", "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(7; "County"; Text[30])
        {
            Caption = 'County', Comment = 'ESP="Municipio"';
            CaptionClass = '5,1,' + "Country/Region Code";
        }
    }
    //Copiar a objeto
    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    var
        PostCode: Record "Post Code";
}