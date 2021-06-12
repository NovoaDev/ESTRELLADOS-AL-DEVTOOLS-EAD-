page 50100 "PageAddin CardPart"
{
    ApplicationArea = All;
    Caption = 'Page';
    PageType = CardPart;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            usercontrol(AddinExample; "Addin Example")
            {
                ApplicationArea = All;

                trigger Ready()
                begin
                    CurrPage.AddinExample.embedHomePage();
                end;
            }
        }
    }
}