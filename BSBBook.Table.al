/// <summary>
/// Table BSB Book (ID 50100).
/// </summary>
table 50100 "BSB Book"
{
    Caption = 'Book';
    DataClassification = CustomerContent;
    DataCaptionFields = "No.", "Description";
    DrillDownPageId = "BSB Book List";
    LookupPageId = "BSB Book List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
            //[x] Search Description füllen

            trigger OnValidate()
            begin
                UpdateSearchDescription();
            end;
        }
        field(3; "Search Description"; Code[100])
        {
            Caption = 'Search Description';
        }
        field(4; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(5; Type; Option)
        {
            Caption = 'Type';
            OptionMembers = " ",Hardcover,Paperback;
            OptionCaption = ' ,Hardcover,Paperback';
        }
        field(7; Created; Date)
        {
            Caption = 'Created';
            Editable = false;
            //[x] Füllen            
        }
        field(8; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
            //[x] Füllen            
        }
        field(10; Author; Text[50])
        {
            Caption = 'Autor';

        }
        field(11; "Author Provision %"; Decimal)
        {
            Caption = 'Autor Provision %';
            MinValue = 0;
            MaxValue = 100;
            DecimalPlaces = 2;
        }
        field(15; ISBN; Code[20])
        {
            Caption = 'ISBN';
        }
        field(16; "No. of Pages"; Integer)
        {
            Caption = 'No. of Pages';
            MinValue = 1;
        }
        field(17; "Edition No."; Integer)
        {
            Caption = 'Edition No.';
            MinValue = 0;
        }
        field(18; "Date of Publishing"; Date)
        {
            Caption = 'Date op Publishing';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
        fieldgroup(DropDown; "No.", "Description", "No. of Pages") { }
        fieldgroup(Brick; "No.", Description, Author, "No. of Pages") { }
    }

    var
        OnDeleteBookErr: Label 'Nicht löschen!';

    trigger OnInsert()
    begin
        "Created" := Today;
    end;

    trigger OnModify()
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnDelete()
    begin
        Error(OnDeleteBookErr);
    end;

    trigger OnRename()
    begin
        "Last Date Modified" := Today;
    end;

    /// <summary>
    /// Bringt Fehler, wenn gesperrt.
    /// </summary>
    procedure TestBlocked()
    begin
        TestField(Blocked, false);
    end;

    /// <summary>
    /// UpdateSearchDescription.
    /// </summary>
    procedure UpdateSearchDescription()
    begin
        if ("Search Description" = UpperCase(xRec.Description)) or ("Search Description" = '') then
            "Search Description" := CopyStr(Description, 1, MaxStrLen("Search Description"));
    end;
    //[x] nicht löschen
    //[x] Auf Blocked testen

    /// <summary>
    /// ShowCard.
    /// </summary>
    /// <param name="BSBBook">Record "BSB Book".</param>
    local procedure ShowCard(BSBBook: Record "BSB Book")
    begin
        page.RunModal(page::"BSB Book Card", BSBBook);
    end;

    /// <summary>
    /// ShowCard.
    /// </summary>
    procedure ShowCard()
    begin
        ShowCard(Rec);
    end;

    /// <summary>
    /// ShowCard.
    /// </summary>
    /// <param name="BookNo">Code[20].</param>
    procedure ShowCard(BookNo: Code[20])
    var
        BSBBook: Record "BSB Book";
    begin
        if BSBBook.get(BookNo) then
            ShowCard(BSBBook);
    end;
}