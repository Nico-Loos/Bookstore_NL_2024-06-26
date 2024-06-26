/// <summary>
/// Unknown BSB Customer - Top 10 List (ID 50100) extends Record Customer - Top 10 List.
/// </summary>
reportextension 50100 "BSB Customer - Top 10 List" extends "Customer - Top 10 List"
{
    RDLCLayout = 'BSBCustomerTop10List.ReportExt.rdlc';
    dataset
    {
        // Add changes to dataitems and columns here
        add(Integer)
        {

            column(BSBCountryRegionCode_Customer; Customer."Country/Region Code")
            {
                IncludeCaption = true;
            }
        }
        modify(Customer)
        {
            RequestFilterFields = "Country/Region Code";
        }

    }

    requestpage
    {
        // Add changes to the requestpage here
    }

}