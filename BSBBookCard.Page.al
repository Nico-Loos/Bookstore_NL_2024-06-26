/// <summary>
/// Page BSB Book Card (ID 50101).
/// </summary>
page 50100 "BSB Book Card"
{
    Caption = 'Book Card';
    PageType = Card;
    Editable = true;
    SourceTable = "BSB Book";
    ApplicationArea = All;
    UsageCategory = Documents;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'No.';
                    Importance = Promoted;
                }
                field(Description; Rec."Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Description';
                    Importance = Promoted;
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Search Description';
                    Importance = Additional;
                }
                field(Blocked; Rec."Blocked")
                {
                    ApplicationArea = All;
                    ToolTip = 'Blocked';
                    Importance = Promoted;
                }
                field(Author; Rec.Author)
                {
                    ApplicationArea = All;
                    ToolTip = 'Author';
                    Importance = Promoted;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Type';
                    Importance = Promoted;
                }
                field(ISBN; Rec.ISBN)
                {
                    ApplicationArea = All;
                    ToolTip = 'ISBN';
                    Importance = Additional;
                }
                field(Created; Rec.Created)
                {
                    ApplicationArea = All;
                    ToolTip = 'Created';
                    Importance = Additional;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = All;
                    ToolTip = 'Last Date Modified';
                    Importance = Additional;
                }
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field("Author Provision %"; Rec."Author Provision %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Author Provision %';
                }
            }
            group(Publishing)
            {
                Caption = 'Publishing';
                field("Edition No."; Rec."Edition No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Edition No.';
                }
                field("No. of Pages"; Rec."No. of Pages")
                {
                    ApplicationArea = All;
                    ToolTip = 'No. of Pages';
                }
                field("Date of Publishing"; Rec."Date of Publishing")
                {
                    ApplicationArea = All;
                    ToolTip = 'Date of Publishing';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Links; Links) { ApplicationArea = RecordLinks; }
            systempart(Notes; Notes) { ApplicationArea = All; }
        }
    }
}