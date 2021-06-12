pageextension 50100 "Example Customer Card" extends "Customer Card"
{
    layout
    {
        addfirst(factboxes)
        {
            part(PageAddin; "PageAddin CardPart")
            {
                ApplicationArea = All;
            }
        }
    }
}