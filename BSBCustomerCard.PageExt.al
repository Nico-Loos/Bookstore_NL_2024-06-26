/// <summary>
/// PageExtension BSB Customer Card (ID 50100) extends Record Customer Card //OriginalId.
/// </summary>
pageextension 50100 "BSB Customer Card" extends "Customer Card" //OriginalId
{
    layout
    {
        addafter(General)
        {
            group("BSB Bookstore")
            {
                Caption = 'Bookstore';

                field("BSB Favorite Book No."; Rec."BSB Favorite Book No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the BSB Favorite Book No. field.', Comment = '%';
                    // trigger OnValidate()
                    // begin
                    //     CurrPage.Update();
                    // end;
                }
                field("BSB Favorite Book Description"; Rec."BSB Favorite Book Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the BSB Favorite Book Description. field.', Comment = '%';
                }
            }
        }
        addafter(Control149)
        {
            part(BSBBookFactbox; "BSB Book Factbox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("BSB Favorite Book No.");
            }
            part(BingMapsCardPart; "BSB BingMapsCardPart")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
            }
        }
    }

    actions
    {
    }
}