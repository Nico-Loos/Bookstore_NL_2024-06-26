/// <summary>
/// Codeunit BSB My Subscriber (ID 50100).
/// </summary>
codeunit 50100 "BSB My Subscriber"
{


    // procedure Meldung(Customer: Record Customer)
    // var
    //     NoBookMessage: Label 'Noch kein Buch eingegeben!';
    // {
    //     if Customer."BSB Favorite Book No." = '' then
    //     Message(NoBookMessage);
    // }

    /// <summary>
    /// FavoriteBookHint.
    /// </summary>
    /// <param name="Rec">VAR Record Customer.</param>
    [EventSubscriber(ObjectType::Table, Database::Customer, OnAfterInsertEvent, '', true, true)]
    local procedure OnAfterInsert_Customer_FavoriteBookHint(var Rec: Record Customer)
    var
        NoBookMessage1Msg: Label 'Noch kein Buch eingegeben!';
    begin
        if Rec."BSB Favorite Book No." = '' then
            Message(NoBookMessage1Msg);
    end;

    /// <summary>
    /// OnAfterModify_Customer_FavoriteBookHint.
    /// </summary>
    /// <param name="Rec">VAR Record Customer.</param>
    [EventSubscriber(ObjectType::table, database::Customer, OnAfterModifyEvent, '', true, true)]
    local procedure OnAfterModify_Customer_FavoriteBookHint(var Rec: Record Customer)
    var
        NoBookMessage2Msg: Label 'Noch kein Buch eingegeben!';
    begin
        // Meldung(Rec);
        if Rec."BSB Favorite Book No." = '' then
            Message(NoBookMessage2Msg);
    end;

}