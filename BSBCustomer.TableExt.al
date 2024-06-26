/// <summary>
/// TableExtension BSB Customer (ID 50100) extends Record Customer.
/// </summary>
tableextension 50100 "BSB Customer" extends Customer
{
    fields
    {
        // Add changes to table fields here
        Field(50100; "BSB Favorite Book No."; Code[20])
        {
            Caption = 'BSB Favorite Book No.';
            TableRelation = "BSB Book";
            trigger OnValidate()
            var
                BSBBook: Record "BSB Book";
            begin
                if ("BSB Favorite Book No." <> xRec."BSB Favorite Book No.") AND ("BSB Favorite Book No." <> '') then begin
                    BSBBook.get("BSB Favorite Book No.");
                    BSBBook.TestBlocked();
                end;

                if ("BSB Favorite Book No." <> xRec."BSB Favorite Book No.") AND (CurrFieldNo > 0) then
                    calcfields("BSB Favorite Book Description");
            end;
        }
        Field(50101; "BSB Favorite Book Description"; Text[100])
        {
            Caption = 'BSB Favorite Book Description';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup("BSB Book".Description Where("No." = Field("BSB Favorite Book No.")));
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

}