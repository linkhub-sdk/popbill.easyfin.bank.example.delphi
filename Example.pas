{********************************************************************************}
{ �˺� ���� ������ȸ API Delphi SDK Example
{
{ - ������Ʈ ���� : 2021-06-14
{ - ���� ������� ����ó : 1600-9854 / code@linkhub.co.kr
{ - SDK Ʃ�丮�� : https://docs.popbill.com/easyfinbank/tutorial/delphi
{
{********************************************************************************}


unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo, Popbill, PopbillEasyFinBank, ExtCtrls, Grids;

const

        // ��ũ���̵�, ������û�� �߱޹��� ���������� ����.
        LinkID = 'TESTER';

        // ���Ű, ���⿡ ����. ������û�� �߱޹��� ���������� ����.
        SecretKey = 'SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I=';
  

type
  TTfrmExample = class(TForm)
    Label3: TLabel;
    txtCorpNum: TEdit;
    Label4: TLabel;
    txtUserID: TEdit;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    btnJoinMember: TButton;
    btnCheckIsMember: TButton;
    btnCheckID: TButton;
    GroupBox11: TGroupBox;
    btnGetChargeInfo: TButton;
    GroupBox4: TGroupBox;
    btnUpdateContact: TButton;
    btnRegistContact: TButton;
    btnListContact: TButton;
    GroupBox16: TGroupBox;
    btnGetCorpInfo: TButton;
    btnUpdateCorpInfo: TButton;
    GroupBox2: TGroupBox;
    btnGetAccessURL: TButton;
    GroupBox7: TGroupBox;
    btnGetChargeURL: TButton;
    btnGetBalance: TButton;
    GroupBox10: TGroupBox;
    btnGetPartnerBalance: TButton;
    btnGetPartnerURL_CHRG: TButton;
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox12: TGroupBox;
    btnRequestJob: TButton;
    btnGetJobState: TButton;
    btnListActiveJob: TButton;
    btnSaveMemo: TButton;
    btnSummary: TButton;
    btnSearch: TButton;
    btnGetBankAccountMgtURL: TButton;
    btnListBankAccount: TButton;
    btnGetFlatRatePopUpURL: TButton;
    btnGetFlatRateState: TButton;
    StringGrid1: TStringGrid;
    Label2: TLabel;
    txtJobID: TEdit;
    Label1: TLabel;
    txtTID: TEdit;
    btnRegistBankAccount: TButton;
    btnUpdateBankAccount: TButton;
    btnGetBankAccountInfo: TButton;
    btnCloseBankAccount: TButton;
    btnRevokeCloseBankAccount: TButton;
    btnDeleteBankAccount: TButton;
    btnGetPaymentURL: TButton;
    btnGetUseHistoryURL: TButton;
    btnGetContactInfo: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnGetChargeInfoClick(Sender: TObject);
    procedure btnCheckIsMemberClick(Sender: TObject);
    procedure btnCheckIDClick(Sender: TObject);
    procedure btnJoinMemberClick(Sender: TObject);
    procedure btnGetBalanceClick(Sender: TObject);
    procedure btnGetChargeURLClick(Sender: TObject);
    procedure btnGetPartnerBalanceClick(Sender: TObject);
    procedure btnGetPartnerURL_CHRGClick(Sender: TObject);
    procedure btnRegistContactClick(Sender: TObject);
    procedure btnListContactClick(Sender: TObject);
    procedure btnUpdateContactClick(Sender: TObject);
    procedure btnGetCorpInfoClick(Sender: TObject);
    procedure btnUpdateCorpInfoClick(Sender: TObject);
    procedure btnGetAccessURLClick(Sender: TObject);
    procedure btnGetFlatRatePopUpURLClick(Sender: TObject);
    procedure btnGetFlatRateStateClick(Sender: TObject);
    procedure btnGetBankAccountMgtURLClick(Sender: TObject);
    procedure btnListBankAccountClick(Sender: TObject);
    procedure btnRequestJobClick(Sender: TObject);
    procedure btnGetJobStateClick(Sender: TObject);
    procedure btnListActiveJobClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnSummaryClick(Sender: TObject);
    procedure btnSaveMemoClick(Sender: TObject);
    procedure OnSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btnRegistBankAccountClick(Sender: TObject);
    procedure btnUpdateBankAccountClick(Sender: TObject);
    procedure btnGetBankAccountInfoClick(Sender: TObject);
    procedure btnCloseBankAccountClick(Sender: TObject);
    procedure btnRevokeCloseBankAccountClick(Sender: TObject);
    procedure btnDeleteBankAccountClick(Sender: TObject);
    procedure btnGetPaymentURLClick(Sender: TObject);
    procedure btnGetUseHistoryURLClick(Sender: TObject);
    procedure btnGetContactInfoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TfrmExample: TTfrmExample;
  easyFinBankService : TEasyFinBankService;
  
implementation

{$R *.DFM}

procedure TTfrmExample.FormCreate(Sender: TObject);
begin
        easyFinBankService := TEasyFinBankService.Create(LinkID,SecretKey);

        // ����ȯ�� ������, true(���߿�), false(�����)
        easyFinBankService.IsTest := true;

        // Exception ó������,  �⺻��(true)
        easyFinBankService.IsThrowException := false;

        // ������ū IP���ѱ�� ��뿩��, true(����)
        easyFinBankService.IPRestrictOnOff := true;

        //���ýý��� �ð� ��뿩��, true(���), false(�̻��) - �⺻��
        easyFinBankService.UseLocalTimeYN := false;

        StringGrid1.Cells[0,0] := 'tid';
        StringGrid1.Cells[1,0] := 'trdate';
        StringGrid1.Cells[2,0] := 'trserial';
        StringGrid1.Cells[3,0] := 'trdt';
        StringGrid1.Cells[4,0] := 'accIn';
        StringGrid1.Cells[5,0] := 'accOut';
        StringGrid1.Cells[6,0] := 'balance';
        StringGrid1.Cells[7,0] := 'remark1';
        StringGrid1.Cells[8,0] := 'remark2';
        StringGrid1.Cells[9,0] := 'remark3';
        StringGrid1.Cells[10,0] := 'remark4';
        StringGrid1.Cells[11,0] := 'memo';
end;

Function BoolToStr(b:Boolean):String;
begin
    if b = true then BoolToStr:='True';
    if b = false then BoolToStr:='False';
end;


procedure TTfrmExample.btnGetChargeInfoClick(Sender: TObject);
var
        chargeInfo : TEasyFinBankChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { ���� ������ȸ ���� ���������� Ȯ���մϴ�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#GetChargeInfo
        {**********************************************************************}

        try
                chargeInfo := easyFinBankService.GetChargeInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
                tmp := 'unitCost (�ܰ�) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (��������) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (��������) : ' + chargeInfo.rateSystem + #13;
                ShowMessage(tmp);
        end;
end;

procedure TTfrmExample.btnCheckIsMemberClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { �ش� ������� ��Ʈ�� ����ȸ�� ���Կ��θ� Ȯ���մϴ�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#CheckIsMember 
        {**********************************************************************}

        try
                response := easyFinBankService.CheckIsMember(txtCorpNum.text, LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;

end;

procedure TTfrmExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { ���̵� �ߺ� ���θ� Ȯ���մϴ�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#CheckID
        {**********************************************************************}

        try
                response := easyFinBankService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TTfrmExample.btnJoinMemberClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin
        {**********************************************************************}
        { ��Ʈ���� ����ȸ������ ȸ�������� ��û�մϴ�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#JoinMember
        {**********************************************************************}

        // ��ũ���̵�
        joinInfo.LinkID := LinkID;

        // ����ڹ�ȣ, '-' ���� 10�ڸ� 
        joinInfo.CorpNum := '1234567890';

        // ��ǥ�� ����, �ִ� 100��
        joinInfo.CEOName := '��ǥ�ڸ�';

        // ��ȣ��, �ִ� 200��
        joinInfo.CorpName := '��ȣ��';

        // �ּ�, �ִ� 300��
        joinInfo.Addr := '�ּ�';

        // ����, �ִ� 100��
        joinInfo.BizType := '����';

        // ����, �ִ� 100��
        joinInfo.BizClass := '����';

        // ���̵�, 6�� �̻� 50�� �̸�
        joinInfo.ID     := 'userid';

        // ��й�ȣ (8�� �̻� 20�� �̸�) ����, ���� ,Ư������ ����
        joinInfo.Password := 'asdf123!@';

        // ����ڸ�, �ִ� 100��
        joinInfo.ContactName := '����ڸ�';

        // ����� ����ó, �ִ� 20��
        joinInfo.ContactTEL :='070-4304-2991';

        // ����� �޴�����ȣ, �ִ� 20��
        joinInfo.ContactHP := '010-000-1111';

        // ����� ���� �ּ�
        joinInfo.ContactEmail := 'code@linkhub.co.kr';

        try
                response := easyFinBankService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;

end;

procedure TTfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { ����ȸ���� �ܿ�����Ʈ�� Ȯ���մϴ�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#GetBalance
        {**********************************************************************}

        try
                balance := easyFinBankService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));
        end;

end;

procedure TTfrmExample.btnGetChargeURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { ����ȸ�� ����Ʈ ���� URL�� ��ȯ�մϴ�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#GetChargeURL
        {**********************************************************************}

        try
                resultURL := easyFinBankService.getChargeURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
                ShowMessage('����Ʈ���� URL ' + #13 + resultURL);
        end;

end;

procedure TTfrmExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { ��Ʈ���� �ܿ�����Ʈ�� Ȯ���մϴ�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#GetPartnerBalance
        {**********************************************************************}

        try
                balance := easyFinBankService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));
        end;

end;

procedure TTfrmExample.btnGetPartnerURL_CHRGClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { ��Ʈ�� ����Ʈ ���� URL�� ��ȯ�մϴ�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#GetPartnerURL
        {**********************************************************************}

        try
                resultURL := easyFinBankService.getPartnerURL(txtCorpNum.Text, 'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;

end;

procedure TTfrmExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        {**********************************************************************}
        { ����ȸ���� ����ڸ� �űԷ� ����մϴ�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#RegistContact
        {**********************************************************************}

        // [�ʼ�] ����� ���̵� (6�� �̻� 50�� �̸�)
        joinInfo.id := 'testkorea';

        // ��й�ȣ (8�� �̻� 20�� �̸�) ����, ���� ,Ư������ ����
        joinInfo.Password := 'asdf123!@';

        // [�ʼ�] ����ڸ� (�ѱ��̳� ���� 100�� �̳�)
        joinInfo.personName := '����ڸ�';

        // [�ʼ�] ����ó (�ִ� 20��)
        joinInfo.tel := '070-4304-2991';

        // �޴�����ȣ (�ִ� 20��)
        joinInfo.hp := '010-1111-2222';

        // [�ʼ�] �̸��� �ּ� (�ִ� 100��)
        joinInfo.email := 'test@test.com';

        // ����� ����, 1-���α��� / 2-�б���� / 3-ȸ�����
        joinInfo.searchRole := '3';

        try
                response := easyFinBankService.RegistContact(txtCorpNum.text, joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;

end;

procedure TTfrmExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { ����ȸ���� ����� ����� Ȯ���մϴ�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#ListContact
        {**********************************************************************}

        try
                InfoList := easyFinBankService.ListContact(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
                tmp := 'id(���̵�) | email(�̸���) | hp(�޴���) | personName(����) | searchRole(����� ����) | ';
                tmp := tmp + 'tel(����ó) | fax(�ѽ�) | mgrYN(������ ����) | regDT(����Ͻ�) | state(����)' + #13;

                for i := 0 to Length(InfoList) -1 do
                begin
                    tmp := tmp + InfoList[i].id + ' | ';
                    tmp := tmp + InfoList[i].email + ' | ';
                    tmp := tmp + InfoList[i].hp + ' | ';
                    tmp := tmp + InfoList[i].personName + ' | ';
                    tmp := tmp + InfoList[i].searchRole + ' | ';
                    tmp := tmp + InfoList[i].tel + ' | ';
                    tmp := tmp + InfoList[i].fax + ' | ';
                    tmp := tmp + BoolToStr(InfoList[i].mgrYN) + ' | ';
                    tmp := tmp + InfoList[i].regDT + ' | ';
                    tmp := tmp + IntToStr(InfoList[i].state) + #13;
                end;
                ShowMessage(tmp);
        end;
end;

procedure TTfrmExample.btnUpdateContactClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { ����ȸ���� ����� ������ �����մϴ�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#UpdateContact
        {**********************************************************************}

        contactInfo := TContactInfo.Create;

        // ����� ���̵�
        contactInfo.id := 'testkorea';

        // ����ڸ� (�ִ� 100��)
        contactInfo.personName := '�׽�Ʈ �����';

        // ����ó (�ִ� 20��)
        contactInfo.tel := '070-4304-2991';

        // �޴�����ȣ (�ִ� 20��)
        contactInfo.hp := '010-4324-1111';

        // �̸��� �ּ� (�ִ� 100��)
        contactInfo.email := 'test@test.com';

        // �ѽ���ȣ (�ִ� 20��)
        contactInfo.fax := '02-6442-9799';

        // ����� ����, 1-���α��� / 2-�б���� / 3-ȸ�����
        contactInfo.searchRole := '3';

        try
                response := easyFinBankService.UpdateContact(txtCorpNum.text, contactInfo, txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;

end;

procedure TTfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        {**********************************************************************}
        { ����ȸ���� ȸ�������� Ȯ���մϴ�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#GetCorpInfo
        {**********************************************************************}

        try
                corpInfo := easyFinBankService.GetCorpInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
                tmp := 'CorpName (��ȣ) : ' + corpInfo.CorpName + #13;
                tmp := tmp + 'CeoName (��ǥ�ڼ���) : ' + corpInfo.CeoName + #13;
                tmp := tmp + 'BizType (����) : ' + corpInfo.BizType + #13;
                tmp := tmp + 'BizClass (����) : ' + corpInfo.BizClass + #13;
                tmp := tmp + 'Addr (�ּ�) : ' + corpInfo.Addr + #13;
                ShowMessage(tmp);
        end;

end;

procedure TTfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { ����ȸ���� ȸ�������� �����մϴ�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#UpdateCorpInfo
        {**********************************************************************}

        corpInfo := TCorpInfo.Create;

        // ��ǥ�ڸ�, �ִ� 30��
        corpInfo.ceoname := '��ǥ�ڸ�';

        // ��ȣ, �ִ� 70��
        corpInfo.corpName := '��ȣ';

        // ����, �ִ� 40��
        corpInfo.bizType := '����';

        // ����, �ִ� 40��
        corpInfo.bizClass := '����';

        // �ּ�, �ִ� 300��
        corpInfo.addr := '����Ư���� ������ ������� 517';

        try
                response := easyFinBankService.UpdateCorpInfo(txtCorpNum.text, corpInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;

end;

procedure TTfrmExample.btnGetAccessURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { �˺�(www.popbill.com)�� �α��ε� �˾� URL�� ��ȯ�մϴ�.
        { - URL ������å�� ���� ��ȯ�� URL�� 30���� ��ȿ�ð��� �����ϴ�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#GetAccessURL
        {**********************************************************************}

        try
                resultURL := easyFinBankService.getAccessURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TTfrmExample.btnGetFlatRatePopUpURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { ������ ���� ��û URL�� ��ȯ�Ѵ�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#GetFlatRatePopUpURL 
        {**********************************************************************}

        try
                resultURL := easyFinBankService.getFlatRatePopUpURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;

end;

procedure TTfrmExample.btnGetFlatRateStateClick(Sender: TObject);
var
        stateInfo : TEasyFinBankFlatRate;
        tmp, bankCode, accountNumber : String;
begin
        {**********************************************************************}
        { ������ ���� ���¸� Ȯ���մϴ�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#GetFlatRateState
        {**********************************************************************}

        // �����ڵ�
        bankCode := '0000';

        // ���� ���¹�ȣ
        accountNumber := '131020538600';

        try
                stateInfo := easyFinBankService.GetFlatRateState(txtCorpNum.text, bankCode, accountNumber);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin

                tmp := 'referenceID (���� ���̵�) : ' + stateInfo.referenceID + #13;
                tmp := tmp + 'contractDT (������ ���� �����Ͻ�) : ' + stateInfo.contractDT + #13;
                tmp := tmp + 'useEndDate (������ ���� �����Ͻ�) : ' + stateInfo.useEndDate + #13;
                tmp := tmp + 'baseDate (�ڵ����� ������) : ' + IntToStr(stateInfo.baseDate) + #13;
                tmp := tmp + 'state (������ ���� ����) : ' + IntToStr(stateInfo.state) + #13;
                tmp := tmp + 'closeRequestYN (������ ������û ����) : ' + BoolToStr(stateInfo.closeRequestYN) + #13;
                tmp := tmp + 'useRestrictYN (������ ������� ����) : ' + BoolToStr(stateInfo.useRestrictYN) + #13;
                tmp := tmp + 'closeOnExpired (������ ����� ���� ����) : ' + BoolToStr(stateInfo.closeOnExpired) + #13;
                tmp := tmp + 'unPaidYN (�̼��� ���� ����) : ' + BoolToStr(stateInfo.unPaidYN) + #13;
                ShowMessage(tmp);
        end;
end;

procedure TTfrmExample.btnGetBankAccountMgtURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { ���� ���� �˾� URL�� ��ȯ�Ѵ�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#GetBankAccountMgtURL
        {**********************************************************************}

        try
                resultURL := easyFinBankService.getBankAccountMgtURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
                ShowMessage('���� ���� �˾� URL' + #13 + resultURL);
        end;

end;

procedure TTfrmExample.btnListBankAccountClick(Sender: TObject);
var
        bankAccountList : TEasyFinBankAccountInfoList;
        tmp : String;
        i : Integer;
begin
        {************************************************************************}
        { �˺��� ��ϵ� ������� ����� ��ȯ�Ѵ�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#ListBankAccount
        {************************************************************************}

        try
                bankAccountList := easyFinBankService.ListBankAccount(txtCorpNum.text);

        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if easyFinBankService.LastErrCode <> 0 then
        begin

                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin        
                tmp := 'accountNumber(���¹�ȣ) | bankCode(�����ڵ�) | accountName(���� ��Ī) | accountType(���� ����) | ';
                tmp := tmp + 'state(���� ������ ����) | memo(�޸�)' + #13 ;

                for i := 0 to Length(bankAccountList) -1 do
                begin
                    tmp := tmp + bankAccountList[i].accountNumber + ' | ';
                    tmp := tmp + bankAccountList[i].bankCode + ' | ';
                    tmp := tmp + bankAccountList[i].accountName + ' | ';
                    tmp := tmp + bankAccountList[i].accountType + ' | ';
                    tmp := tmp + IntToStr(bankAccountList[i].state) + ' | ';
                    tmp := tmp + bankAccountList[i].contractDT + ' | ';
                    tmp := tmp + IntToStr(bankAccountList[i].baseDate) + ' | ';
                    tmp := tmp + bankAccountList[i].useEndDate + ' | ';
                    tmp := tmp + IntToStr(bankAccountList[i].contractState) + ' | ';
                    tmp := tmp + BoolToStr(bankAccountList[i].closeRequestYN) + ' | ';
                    tmp := tmp + BoolToStr(bankAccountList[i].useRestrictYN) + ' | ';
                    tmp := tmp + BoolToStr(bankAccountList[i].closeOnExpired) + ' | ';
                    tmp := tmp + BoolToStr(bankAccountList[i].unPaidYN) + ' | ';
                    tmp := tmp + bankAccountList[i].memo + #13;
                end;
                ShowMessage(tmp);
        end;
end;


procedure TTfrmExample.btnRequestJobClick(Sender: TObject);
var
        BankCode, AccountNumber, SDate, EDate, jobID: String;
begin
        {************************************************************************}
        { ���� �ŷ����� ������ ��û�Ѵ�.
        { - �˻��Ⱓ�� ������ ���� 90�� �̳��θ� ��û�� �� �ִ�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#RequestJob
        {************************************************************************}

        // �����ڵ�
        bankCode := '0000';

        // ���¹�ȣ
        accountNumber := '0022197672400';

        // ��������, ��������(yyyyMMdd)
        SDate := '20210601';

        // ��������, ��������(yyyyMMdd)
        EDate := '20210615';

        try
                jobID := easyFinBankService.RequestJob(txtCorpNum.text, bankCode, accountNumber, SDate, EDate);

        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
                ShowMessage('jobID : ' + jobID);
                txtjobID.text := jobID;
        end;
end;

procedure TTfrmExample.btnGetJobStateClick(Sender: TObject);
var
        jobInfo : TEasyFinBankJobInfo;
        tmp : String;
begin
        {**********************************************************************}
        { ������û�� ���� ���¸� Ȯ���մϴ�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#GetJobState
        {**********************************************************************}

        try
                jobInfo := easyFinBankService.GetJobState(txtCorpNum.text, txtJobId.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
                tmp := 'jobID(�۾����̵�) : '+ jobInfo.jobID + #13;
                tmp := tmp + 'jobState(��������) : '+ IntToStr(jobInfo.jobState) + #13;
                tmp := tmp + 'startDate(��������) : ' + jobInfo.startDate + #13;
                tmp := tmp + 'endDate(��������) : ' + jobInfo.endDate + #13;
                tmp := tmp + 'errorCode(�����ڵ�) : ' + IntToStr(jobInfo.errorCode) + #13;
                tmp := tmp + 'errorReason(�����޽���) : ' + jobInfo.errorReason + #13;
                tmp := tmp + 'jobStartDT(�۾� �����Ͻ�) : ' + jobInfo.jobStartDT + #13;
                tmp := tmp + 'jobEndDT(�۾� �����Ͻ�) : ' + jobInfo.jobEndDT + #13;
                tmp := tmp + 'regDT(���� ��û�Ͻ�) : ' + jobInfo.regDT + #13 + #13;
                ShowMessage(tmp);
        end;
end;

procedure TTfrmExample.btnListActiveJobClick(Sender: TObject);
var
        jobList : TEasyFinBankJobInfoList;
        tmp : String;
        i : Integer;
begin
        {************************************************************************}
        { 1�ð� �̳� ���� ��û�� �۾� ���¸� Ȯ���մϴ�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#ListActiveJob         
        {************************************************************************}

        try
                jobList := easyFinBankService.ListActiveJob(txtCorpNum.text);

        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if easyFinBankService.LastErrCode <> 0 then
        begin

                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin        
                tmp := 'jobID(�۾����̵�) | jobState(��������) | ';
                tmp := tmp + 'startDate (��������) | endDate(��������) | errorCode(�����ڵ�) | errorReason(�����޽���) | ';
                tmp := tmp + 'jobStartDT(�۾� �����Ͻ�) | jobEndDT(�۾� �����Ͻ�) | regDT(���� ��û�Ͻ�) ' + #13;

                for i := 0 to Length(jobList) -1 do
                begin
                    tmp := tmp + jobList[i].jobID + ' | ';
                    tmp := tmp + IntToStr(jobList[i].jobState) + ' | ';
                    tmp := tmp + jobList[i].startDate + ' | ';
                    tmp := tmp + jobList[i].endDate + ' | ';
                    tmp := tmp + IntToStr(jobList[i].errorCode) + ' | ';
                    tmp := tmp + jobList[i].errorReason + ' | ';
                    tmp := tmp + jobList[i].jobStartDT + ' | ';
                    tmp := tmp + jobList[i].jobEndDT + ' | ';
                    tmp := tmp + jobList[i].regDT + #13;
                end;
                txtJobId.text := jobList[0].jobID;
                ShowMessage(tmp);
        end;
end;

procedure TTfrmExample.btnSearchClick(Sender: TObject);
var
        tradeType : array of string;
        page : Integer;
        perPage : Integer;
        order : String;
        searchInfo : TEasyFinBankSearchResult;
        tmp : string;
        i : Integer;
        searchString : string;

begin
        {**********************************************************************}
        { ���� �ŷ������� ��ȸ�Ѵ�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#Search
        {**********************************************************************}

        // �������� �迭, I - �Ա�, O - ���
        SetLength(tradeType, 2);
        tradeType[0] := 'I';
        tradeType[1] := 'O';

        // ��������ȣ
        Page := 1;

        // �������� �˻�����
        PerPage := 10;

        // ���Ĺ���, D-��������, A-��������
        Order := 'D';
        
        // ��ȸ �˻���, �Ա�/��ݾ�, �޸�, ���� like �˻�
        SearchString := '';

        try
                searchInfo := easyFinBankService.Search(txtCorpNum.text, txtJobId.text, TradeType, SearchString, Page, PerPage, Order, txtUserID.text);

        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;


        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
                exit;
        end
        else
        begin

                tmp := 'code (�����ڵ�) : ' + IntToStr(searchInfo.code) + #13;
                tmp := tmp + 'total (�� �˻���� �Ǽ�) : ' + IntToStr(searchInfo.total) + #13;
                tmp := tmp + 'perPage (�������� �˻�����) : ' + IntToStr(searchInfo.perPage) + #13;
                tmp := tmp + 'pageNum (������ ��ȣ) : ' + IntToStr(searchInfo.pageNum) + #13;
                tmp := tmp + 'pageCount (������ ����) : ' + IntToStr(searchInfo.pageCount)+ #13;
                tmp := tmp + 'lastScrapDT (���� ��ȸ�Ͻ�) : ' + searchInfo.lastScrapDT + #13;
                tmp := tmp + 'message (���� �޽���) : ' + searchInfo.message + #13 + #13;

                for i := 0 to length(searchInfo.list) - 1 do
                begin
                        StringGrid1.Cells[0, i+1] := searchInfo.list[i].tid;          // �ŷ����� ���̵�
                        StringGrid1.Cells[1, i+1] := searchInfo.list[i].trdate;       // �ŷ�����
                        StringGrid1.Cells[2, i+1] := IntToStr(searchInfo.list[i].trserial);     // �ŷ� �Ϸù�ȣ
                        StringGrid1.Cells[3, i+1] := searchInfo.list[i].trdt;         // �ŷ��Ͻ�
                        StringGrid1.Cells[4, i+1] := searchInfo.list[i].accIn;        // �Աݾ�
                        StringGrid1.Cells[5, i+1] := searchInfo.list[i].accOut;       // ��ݾ�
                        StringGrid1.Cells[6, i+1] := searchInfo.list[i].balance;      // �ܾ�
                        StringGrid1.Cells[7, i+1] := searchInfo.list[i].remark1;      // ���1
                        StringGrid1.Cells[8, i+1] := searchInfo.list[i].remark2;      // ���2
                        StringGrid1.Cells[9, i+1] := searchInfo.list[i].remark3;      // ���3
                        StringGrid1.Cells[10, i+1] := searchInfo.list[i].remark4;     // ���4
                        StringGrid1.Cells[11, i+1] := searchInfo.list[i].memo;        // �޸�
                end;
                ShowMessage(tmp);
        end;
end;

procedure TTfrmExample.btnSummaryClick(Sender: TObject);
var
        tradeType : array of string;
        summaryInfo : TEasyFinBankSummary;
        tmp : string;
        searchString : string;
begin
        {************************************************************************}
        { �ŷ����� ��������� ��ȸ�Ѵ�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#Summary
        {************************************************************************}

        // �ŷ����� �迭, I-�Ա�, O-���
        SetLength(tradeType, 2);
        tradeType[0] := 'I';
        tradeType[1] := 'O';

        // ��ȸ �˻���, �Ա�/��ݾ�, �޸�, ���� like �˻�
        SearchString := '';

        try
                summaryInfo := easyFinBankService.Summary(txtCorpNum.text, txtJobId.text, TradeType, SearchString, txtUserID.text);

        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
                exit;
        end
        else
        begin
                tmp := 'count (���� ��� �Ǽ�) : ' + IntToStr(summaryInfo.count) + #13;
                tmp := tmp + 'cntAccIn (�Աݰŷ� �Ǽ�) : ' + IntToStr(summaryInfo.cntAccIn) + #13;
                tmp := tmp + 'cntAccOut (��ݰŷ� �Ǽ�) : ' + IntToStr(summaryInfo.cntAccOut) + #13;
                tmp := tmp + 'totalAccIn (�Աݾ� �հ�) : ' + IntToStr(summaryInfo.totalAccIn) + #13;
                tmp := tmp + 'totalAccOut (��ݾ� �հ�) : ' + IntToStr(summaryInfo.totalAccOut) + #13;

                ShowMessage(tmp);
                exit;
        end;
end;

procedure TTfrmExample.btnSaveMemoClick(Sender: TObject);
var
        response : TResponse;
        Memo : String;
begin
        {**********************************************************************}
        { ���� �ŷ������� �޸� �����Ѵ�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#SaveMemo
        {**********************************************************************}

        // �޸�
        Memo := '�׽�Ʈ�ѱ�';

        try
                response := easyFinBankService.SaveMemo(txtCorpNum.text, txtTID.text, Memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
               ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TTfrmExample.OnSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
        if StringGrid1.Cells[0, Arow] <> '' then
        begin
                txtTID.Text := StringGrid1.Cells[0, Arow];
        end

end;
procedure TTfrmExample.btnRegistBankAccountClick(Sender: TObject);
var
        response : TResponse;
        usePeriod : String;
        bankInfo : TEasyFinBankAccountForm;        
        
begin
        {**********************************************************************}
        { ���¸� ����մϴ�.
        {- https://docs.popbill.com/easyfinbank/delphi/api#RegistBankAccount
        {**********************************************************************}

        // [�ʼ�] �����ڵ�
        // �������-0002 / �������-0003 / ��������-0004 / ����-0007 / ��������-0011 / �츮����-0020
        // SC����-0023 / �뱸����-0031 / �λ�����-0032 / ��������-0034 / ��������-0035 / ��������-0037
        // �泲����-0039 / �������ݰ�-0045 / ��������-0048 / ��ü��-0071 / KEB�ϳ�����-0081 / ��������-0088 / ��Ƽ����-0027
        bankInfo.BankCode := '';
        
        // [�ʼ�] ���¹�ȣ ������('-') ����
        bankInfo.AccountNumber := '';

        // [�ʼ�] ���º�й�ȣ
        bankInfo.AccountPWD := '';

        // [�ʼ�] ��������, "����" �Ǵ� "����" �Է�
        bankInfo.AccountType := '';

        // [�ʼ�] ������ �ĺ���ȣ ('-' ����)
        // ���������� "����"�� ��� : ����ڹ�ȣ('-'���� 10�ڸ�)
        // ���������� "����"�� ��� : ������ �������(6�ڸ�-YYMMDD)
        bankInfo.IdentityNumber := '';

        // ���� ��Ī
        bankInfo.AccountName := '';

        // ���ͳݹ�ŷ ���̵� (�������� �ʼ�)
        bankInfo.BankID := '';

         // ��ȸ���� ���� ���̵� (�뱸����, ����, �������� �ʼ�)
        bankInfo.FastID := '';

        // ��ȸ���� ���� ��й�ȣ (�뱸����, ����, �������� �ʼ�)
        bankInfo.FastPWD := '';

        // �޸�
        bankInfo.Memo := '';        

        // �����Ⱓ(����), 1~12 �Է°���, �̱���� �⺻��(1) ó��
        // ��Ʈ�� ���� ����� ��� �Է°��� ������� 1������ ó��
        usePeriod := '1';        


        try
                response := easyFinBankService.RegistBankAccount(txtCorpNum.text, bankInfo, usePeriod);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
               ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;

end;

procedure TTfrmExample.btnUpdateBankAccountClick(Sender: TObject);
var
        response : TResponse;
        bankInfo : TEasyFinBankAccountForm;        
begin
        {**********************************************************************}
        { �˺��� ��ϵ� ���������� �����մϴ�.
        {- https://docs.popbill.com/easyfinbank/delphi/api#UpdateBankAccount
        {**********************************************************************}

        // [�ʼ�] �����ڵ�
        // �������-0002 / �������-0003 / ��������-0004 / ����-0007 / ��������-0011 / �츮����-0020
        // SC����-0023 / �뱸����-0031 / �λ�����-0032 / ��������-0034 / ��������-0035 / ��������-0037
        // �泲����-0039 / �������ݰ�-0045 / ��������-0048 / ��ü��-0071 / KEB�ϳ�����-0081 / ��������-0088 / ��Ƽ����-0027
        bankInfo.BankCode := '';

        // [�ʼ�] ���¹�ȣ ������('-') ����
        bankInfo.AccountNumber := '';

        // [�ʼ�] ���º�й�ȣ
        bankInfo.AccountPWD := '';

        // ���� ��Ī
        bankInfo.AccountName := '';

        // ���ͳݹ�ŷ ���̵� (�������� �ʼ�)
        bankInfo.BankID := '';

         // ��ȸ���� ���� ���̵� (�뱸����, ����, �������� �ʼ�)
        bankInfo.FastID := '';

        // ��ȸ���� ���� ��й�ȣ (�뱸����, ����, �������� �ʼ�)
        bankInfo.FastPWD := '';

        // �޸�
        bankInfo.Memo := '';        

        try
                response := easyFinBankService.UpdateBankAccount(txtCorpNum.text, bankInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
               ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;

end;

procedure TTfrmExample.btnGetBankAccountInfoClick(Sender: TObject);
var
        bankAccountInfo : TEasyFinBankAccountInfo;
        BankCode, AccountNumber, tmp : string;

begin
        {**********************************************************************}
        { �˺��� ��ϵ� ���������� Ȯ���մϴ�.
        {- https://docs.popbill.com/easyfinbank/delphi/api#GetBankAccountInfo
        {**********************************************************************}

        // [�ʼ�] �����ڵ�
        // �������-0002 / �������-0003 / ��������-0004 / ����-0007 / ��������-0011 / �츮����-0020
        // SC����-0023 / �뱸����-0031 / �λ�����-0032 / ��������-0034 / ��������-0035 / ��������-0037
        // �泲����-0039 / �������ݰ�-0045 / ��������-0048 / ��ü��-0071 / KEB�ϳ�����-0081 / ��������-0088 / ��Ƽ����-0027
        BankCode := '';
        
        // [�ʼ�] ���¹�ȣ ������('-') ����
        AccountNumber := '';

        try
                bankAccountInfo := easyFinBankService.GetBankAccountInfo(txtCorpNum.text, BankCode, AccountNumber);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
                tmp := 'bankCode (�����ڵ�) : ' + bankAccountInfo.bankCode + #13;
                tmp := tmp + 'accountNumber (���¹�ȣ) : ' + bankAccountInfo.accountNumber + #13;
                tmp := tmp + 'accountName (���º�Ī) : ' + bankAccountInfo.accountName + #13;
                tmp := tmp + 'accountType (��������) : ' + bankAccountInfo.accountType + #13;
                tmp := tmp + 'state (���»���) : ' + IntToStr(bankAccountInfo.state) + #13;
                tmp := tmp + 'regDT (����Ͻ�) : ' + bankAccountInfo.regDT + #13;
                tmp := tmp + 'memo (�޸�) : ' + bankAccountInfo.memo + #13;
                tmp := tmp + 'contractDT (������ ���� �����Ͻ�) : ' + bankAccountInfo.contractDt + #13;
                tmp := tmp + 'useEndDate (������ ���� ������) : ' + bankAccountInfo.useEndDate + #13;
                tmp := tmp + 'contractState (������ ����) : ' + IntToStr(bankAccountInfo.contractState) + #13;
                tmp := tmp + 'closeRequestYN (������ ���� ������û ����) : ' + BoolToStr(bankAccountInfo.closeRequestYN) + #13;
                tmp := tmp + 'useRestrictYN (������ ���� ������� ����) : ' + BoolToStr(bankAccountInfo.useRestrictYN) + #13;
                tmp := tmp + 'closeOnExpired (������ ���� ���� �� ��������) : ' + BoolToStr(bankAccountInfo.closeOnExpired) + #13;
                tmp := tmp + 'unPaidYN (�̼��� ���� ����) : ' + BoolToStr(bankAccountInfo.unPaidYN) + #13;

                ShowMessage(tmp);
        end;

end;

procedure TTfrmExample.btnCloseBankAccountClick(Sender: TObject);
var
        response : TResponse;
        BankCode, AccountNumber, CloseType : string;
begin
        {**********************************************************************}
        { �˺��� ��ϵ� ���� ������ ������ ��û�մϴ�.
        {- https://docs.popbill.com/easyfinbank/delphi/api#CloseBankAccountInfo
        {**********************************************************************}

        // [�ʼ�] �����ڵ�
        // �������-0002 / �������-0003 / ��������-0004 / ����-0007 / ��������-0011 / �츮����-0020
        // SC����-0023 / �뱸����-0031 / �λ�����-0032 / ��������-0034 / ��������-0035 / ��������-0037
        // �泲����-0039 / �������ݰ�-0045 / ��������-0048 / ��ü��-0071 / KEB�ϳ�����-0081 / ��������-0088 / ��Ƽ����-0027
        BankCode := '';
        
        // [�ʼ�] ���¹�ȣ ������('-') ����
        AccountNumber := '';

        // ��������, '�Ϲ�', '�ߵ�' �� ���ñ���
        // �Ϲ����� - �̿����� ������ ���Ⱓ���� �̿� �� ����
        // �ߵ����� - ��û�� �������� ����, ������ �ܿ��Ⱓ�� ���ҷ� ���Ǿ� ����Ʈ ȯ�� (���� �̿�Ⱓ �� �ߵ����� �� ���� ȯ��)
        CloseType := '�ߵ�';

        try
                response := easyFinBankService.CloseBankAccountInfo(txtCorpNum.text, BankCode, AccountNumber, CloseType);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TTfrmExample.btnRevokeCloseBankAccountClick(Sender: TObject);
var
        response : TResponse;
        BankCode, AccountNumber : string;
begin
        {**********************************************************************}
        { ���� ������ ������û�� ����մϴ�.
        {- https://docs.popbill.com/easyfinbank/delphi/api#RevokeCloseBankAccountInfo
        {**********************************************************************}

        // [�ʼ�] �����ڵ�
        // �������-0002 / �������-0003 / ��������-0004 / ����-0007 / ��������-0011 / �츮����-0020
        // SC����-0023 / �뱸����-0031 / �λ�����-0032 / ��������-0034 / ��������-0035 / ��������-0037
        // �泲����-0039 / �������ݰ�-0045 / ��������-0048 / ��ü��-0071 / KEB�ϳ�����-0081 / ��������-0088 / ��Ƽ����-0027
        BankCode := '';
        
        // [�ʼ�] ���¹�ȣ ������('-') ����
        AccountNumber := '';


        try
                response := easyFinBankService.RevokeCloseBankAccountInfo(txtCorpNum.text, BankCode, AccountNumber);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TTfrmExample.btnDeleteBankAccountClick(Sender: TObject);
var
        response : TResponse;
        usePeriod : String;
        bankInfo : TEasyFinBankAccountForm;
        
begin
        {**********************************************************************}
        { ������ ���¸� �����մϴ�.
        {- https://docs.popbill.com/easyfinbank/delphi/api#DeleteBankAccount
        {**********************************************************************}

        // [�ʼ�] �����ڵ�
        // �������-0002 / �������-0003 / ��������-0004 / ����-0007 / ��������-0011 / �츮����-0020
        // SC����-0023 / �뱸����-0031 / �λ�����-0032 / ��������-0034 / ��������-0035 / ��������-0037
        // �泲����-0039 / �������ݰ�-0045 / ��������-0048 / ��ü��-0071 / KEB�ϳ�����-0081 / ��������-0088 / ��Ƽ����-0027
        bankInfo.BankCode := '';

        // [�ʼ�] ���¹�ȣ ������('-') ����
        bankInfo.AccountNumber := '';

        try
                response := easyFinBankService.DeleteBankAccount(txtCorpNum.text, bankInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;

end;

procedure TTfrmExample.btnGetPaymentURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { ����ȸ�� ����Ʈ �������� �˾� URL�� ��ȯ�Ѵ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���̴�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#GetPaymentURL
        {**********************************************************************}
        
        try
                resultURL := easyFinBankService.getPaymentURL(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end;
end;

procedure TTfrmExample.btnGetUseHistoryURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { ����ȸ�� ����Ʈ ��볻�� �˾� URL�� ��ȯ�Ѵ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���̴�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#GetUseHistoryURL
        {**********************************************************************}

        try
                resultURL := easyFinBankService.getUseHistoryURL(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end;
end;

procedure TTfrmExample.btnGetContactInfoClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        contactID : string;
        tmp : string;
begin
        {**********************************************************************}
        { ����ȸ�� ����ڹ�ȣ�� ��ϵ� ����� ������ Ȯ���Ѵ�.
        { - https://docs.popbill.com/easyfinbank/delphi/api#GetContactInfo
        {**********************************************************************}

        contactID := 'testkorea';
        
        try
                contactInfo := easyFinBankService.getContactInfo(txtCorpNum.Text, contactID);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(easyFinBankService.LastErrCode) + #10#13 +'����޽��� : '+ easyFinBankService.LastErrMessage);
        end
        else
        begin
                tmp := 'id (���̵�) : ' + contactInfo.id + #13;
                tmp := tmp + 'personName (����� ����) : ' + contactInfo.personName + #13;
                tmp := tmp + 'tel (����� ����ó(��ȭ��ȣ)) : ' + contactInfo.tel + #13;
                tmp := tmp + 'hp (����� �޴�����ȣ) : ' + contactInfo.hp + #13;
                tmp := tmp + 'fax (����� �ѽ���ȣ) : ' + contactInfo.fax + #13;
                tmp := tmp + 'email (����� �̸���) : ' + contactInfo.email + #13;
                tmp := tmp + 'regDT (��� �Ͻ�) : ' + contactInfo.regDT + #13;
                tmp := tmp + 'searchRole (����� ����) : ' + contactInfo.searchRole + #13;
                tmp := tmp + 'mgrYN (������ ����) : ' + booltostr(contactInfo.mgrYN) + #13;
                tmp := tmp + 'state (��������) : ' + inttostr(contactInfo.state) + #13;
                ShowMessage(tmp);
        end
end;

end.
