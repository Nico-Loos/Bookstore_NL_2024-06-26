/// <summary>
/// Page BSB Book Factbox (ID 50102).
/// </summary>
page 50102 "BSB Book Factbox"
{
    Caption = 'Book Details';
    PageType = CardPart;
    SourceTable = "BSB Book";
    Editable = false;
    layout
    {
        area(Content)
        {
            field("No."; Rec."No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                Caption = 'Book No.';
                trigger OnDrillDown()
                begin
                    ShowDetail();
                end;
            }
            field(Description; Rec.Description)
            {
                Caption = 'Book Description';
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Description field.', Comment = '%';
            }
            field("Date of Publishing"; Rec."Date of Publishing")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Date op Publishing field.', Comment = '%';
            }
            field("No. of Pages"; Rec."No. of Pages")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the No. of Pages field.', Comment = '%';
            }
            field(Author; Rec.Author)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Author field.', Comment = '%';
            }
        }
    }

    local procedure ShowDetail()
    begin
        Rec.ShowCard();
    end;
}