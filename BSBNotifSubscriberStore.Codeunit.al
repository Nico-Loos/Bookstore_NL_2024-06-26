codeunit 50102 "BSB Notif. Subscriber Store"
{
    var
        CompanyInformation: Record "Company Information";
        MyNotifications: Record "My Notifications";
        CompInfoNotification: Notification;
        CompInfoNotificationIDTxt: Label 'bf8691d0-92a2-4c52-9ecf-a24457e7bc8f', Locked = true;
#pragma warning disable AA0470
        CompInfoNotificationMessageTxt: Label 'Please enter %1 and %2 in %3';
#pragma warning restore AA0470



    [EventSubscriber(ObjectType::Page, Page::"Sales Order", OnAfterGetCurrRecordEvent, '', true, true)]
    local procedure CheckCompInfoComplete(var Rec: Record "Sales Header")
    var
        Customer: Record Customer;
    begin
        if rec."Sell-to Customer No." = '' then
            exit;

        Customer.get(Rec."Sell-to Customer No.");
        CompanyInformation.get();
        if ((CompanyInformation.Name = '') OR (CompanyInformation."E-Mail" = '')) and MyNotifications.IsEnabledForRecord(CompInfoNotificationIDTxt, Customer) then begin
            CompInfoNotification."Id" := CompInfoNotificationIDTxt;
            CompInfoNotification.Scope := CompInfoNotification.Scope::LocalScope;
            CompInfoNotification.Message := strsubstno(
                CompInfoNotificationMessageTxt,
                CompanyInformation.fieldcaption(Name),
                CompanyInformation.FieldCaption("E-Mail"),
                CompanyInformation.TableCaption);
            CompInfoNotification.AddAction('Edit Companyinformation', Codeunit::"BSB Notif. Subscriber Store", 'OpenCompanyInformation');
            CompInfoNotification.Send();
        end;
    end;

    procedure OpenCompanyInformation(Notification: Notification)
    begin
        page.RunModal(Page::"Company Information");
    end;

    [EventSubscriber(ObjectType::Page, Page::"My Notifications", OnInitializingNotificationWithDefaultState, '', true, true)]
    local procedure OnInitializingNotificationWithDefaultState()
    begin
        MyNotifications.InsertDefaultWithTableNum(CompInfoNotificationIDTxt, 'CompInfo Hint Short', 'Comp Info Hint Desc', database::Customer);
    end;
}