/// <summary>
/// Report BSB Book List (ID 50100).
/// </summary>
report 50100 "BSB Book List"
{
    Caption = 'Book List';
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultRenderingLayout = "Standard Layout Simple";

    dataset
    {
        dataitem("BSB Book"; "BSB Book")
        {
            RequestFilterFields = Type, "Date of Publishing";


            column(No_BSBBook; "No.")
            {
            }
            column(Description_BSBBook; Description)
            {
            }
            column(Author_BSBBook; Author)
            {
            }
            column(DateofPublishing_BSBBook; "Date of Publishing")
            {
            }
            column(EditionNo_BSBBook; "Edition No.")
            {
            }
            column(ISBN_BSBBook; ISBN)
            {
            }
        }
    }

    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }
    }

    rendering
    {
        layout("Standard Layout Simple")
        {
            Type = RDLC;
            LayoutFile = 'BSBBookList.Report.rdlc';
            Caption = 'Caption Book List';
            Summary = 'Summary Book List';
        }
    }
}