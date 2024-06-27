/// <summary>
/// Enum BSB Book Option (ID 50100).
/// </summary>
enum 50100 "BSB Book Option"
{
    Extensible = true;

    value(0; " ")
    {
        Caption = 'None';
    }
    value(1; Hardcover)
    {
        Caption = 'Hardcover';
    }
    value(2; Paperback)
    {
        Caption = 'Paperback';
    }
}