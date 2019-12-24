{********************************************************************************}
{ 팝빌 간편 계좌조회 API Delphi SDK Example
{
{ - 업데이트 일자 : 2019-12-23
{ - 연동 기술지원 연락처 : 1600-9854 / code@linkhub.co.kr
{
{********************************************************************************}


unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo, Popbill, PopbillEasyFinBank, ExtCtrls, Grids;

const

        // 링크아이디, 연동신청시 발급받은 인증정보로 변경.
        LinkID = 'TESTER';

        // 비밀키, 유출에 주의. 연동신청시 발급받은 인증정보로 변경.
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

        // 연동환경 설정값, true(개발용), false(상업용)
        easyFinBankService.IsTest := true;

        // Exception 처리여부,  기본값(true)
        easyFinBankService.IsThrowException := true;

        // 인증토큰 IP제한기능 사용여부, true(권장)
        easyFinBankService.IPRestrictOnOff := true;


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
        { 간편 계좌조호 서비스 과금정보를 확인합니다.
        {**********************************************************************}

        try
                chargeInfo := easyFinBankService.GetChargeInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'응답메시지 : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
                tmp := 'unitCost (단가) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (과금유형) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (과금제도) : ' + chargeInfo.rateSystem + #13;
                ShowMessage(tmp);
        end;
end;

procedure TTfrmExample.btnCheckIsMemberClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 해당 사업자의 파트너 연동회원 가입여부를 확인합니다. 
        {**********************************************************************}

        try
                response := easyFinBankService.CheckIsMember(txtCorpNum.text, LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);

end;

procedure TTfrmExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 아이디 중복 여부를 확인합니다.
        {**********************************************************************}

        try
                response := easyFinBankService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TTfrmExample.btnJoinMemberClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin
        {**********************************************************************}
        {    파트너의 연동회원으로 회원가입을 요청합니다.
        {**********************************************************************}

        // 링크아이디
        joinInfo.LinkID := LinkID;

        // 사업자번호, '-' 제외 10자리 
        joinInfo.CorpNum := '1234567890';

        // 대표자 성명, 최대 100자
        joinInfo.CEOName := '대표자명';

        // 상호명, 최대 200자
        joinInfo.CorpName := '상호명';

        // 주소, 최대 300자
        joinInfo.Addr := '주소';

        // 업태, 최대 100자
        joinInfo.BizType := '업태';

        // 종목, 최대 100자
        joinInfo.BizClass := '종목';

        // 아이디, 6자 이상 50자 미만
        joinInfo.ID     := 'userid';

        // 비밀번호, 6자 이상 20자 미만
        joinInfo.PWD    := 'pwd_must_be_long_enough';

        // 담당자명, 최대 100자
        joinInfo.ContactName := '담당자명';

        // 담당자 연락처, 최대 20자
        joinInfo.ContactTEL :='070-4304-2991';

        // 담당자 휴대폰번호, 최대 20자
        joinInfo.ContactHP := '010-000-1111';

        // 담당자 메일 주소
        joinInfo.ContactEmail := 'code@linkhub.co.kr';

        try
                response := easyFinBankService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TTfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { 연동회원의 잔여포인트를 확인합니다.
        {**********************************************************************}

        try
                balance := easyFinBankService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('잔여포인트 : ' + FloatToStr(balance));
end;

procedure TTfrmExample.btnGetChargeURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        {    연동회원 포인트 충전 URL을 반환합니다.
        {**********************************************************************}

        try
                resultURL := easyFinBankService.getChargeURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('포인트충전 URL ' + #13 + resultURL);
end;

procedure TTfrmExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { 파트너의 잔여포인트를 확인합니다.
        {**********************************************************************}

        try
                balance := easyFinBankService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('잔여포인트 : ' + FloatToStr(balance));
end;

procedure TTfrmExample.btnGetPartnerURL_CHRGClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        {    파트너 포인트 충전 URL을 반환합니다.
        {**********************************************************************}

        try
                resultURL := easyFinBankService.getPartnerURL(txtCorpNum.Text, 'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('파트너 포인트충전 URL ' + #13 + resultURL);
end;

procedure TTfrmExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        {**********************************************************************}
        { 연동회원의 담당자를 신규로 등록합니다.
        {**********************************************************************}

        // [필수] 담당자 아이디 (6자 이상 50자 미만)
        joinInfo.id := 'testkorea';

        // [필수] 비밀번호 (6자 이상 20자 미만)
        joinInfo.pwd := 'thisispassword';

        // [필수] 담당자명 (한글이나 영문 100자 이내)
        joinInfo.personName := '담당자명';

        // [필수] 연락처 (최대 20자)
        joinInfo.tel := '070-4304-2991';

        // 휴대폰번호 (최대 20자)
        joinInfo.hp := '010-1111-2222';

        // [필수] 이메일 주소 (최대 100자)
        joinInfo.email := 'test@test.com';

        // 회사조회 권한여부, true-회사조회 / false-개인조회
        joinInfo.searchAllAllowYN := false;

        // 관리자 권한여부, true-관리자 / false-사용자
        joinInfo.mgrYN := false;

        try
                response := easyFinBankService.RegistContact(txtCorpNum.text, joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TTfrmExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 연동회원의 담당자 목록을 확인합니다.                                 }
        {**********************************************************************}

        try
                InfoList := easyFinBankService.ListContact(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'id(아이디) | email(이메일) | hp(휴대폰) | personName(성명) | searchAllAllowYN(회사조회 권한) | ';
        tmp := tmp + 'tel(연락처) | fax(팩스) | mgrYN(관리자 여부) | regDT(등록일시) | state(상태)' + #13;

        for i := 0 to Length(InfoList) -1 do
        begin
            tmp := tmp + InfoList[i].id + ' | ';
            tmp := tmp + InfoList[i].email + ' | ';
            tmp := tmp + InfoList[i].hp + ' | ';
            tmp := tmp + InfoList[i].personName + ' | ';
            tmp := tmp + BoolToStr(InfoList[i].searchAllAllowYN) + ' | ';
            tmp := tmp + InfoList[i].tel + ' | ';
            tmp := tmp + InfoList[i].fax + ' | ';
            tmp := tmp + BoolToStr(InfoList[i].mgrYN) + ' | ';
            tmp := tmp + InfoList[i].regDT + ' | ';
            tmp := tmp + IntToStr(InfoList[i].state) + #13;
        end;
        ShowMessage(tmp);
end;

procedure TTfrmExample.btnUpdateContactClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { 연동회원의 담당자 정보를 수정합니다.                                 }
        {**********************************************************************}

        contactInfo := TContactInfo.Create;

        // 담당자 아이디
        contactInfo.id := 'testkorea';

        // 담당자명 (최대 100자)
        contactInfo.personName := '테스트 담당자';

        // 연락처 (최대 20자)
        contactInfo.tel := '070-4304-2991';

        // 휴대폰번호 (최대 20자)
        contactInfo.hp := '010-4324-1111';

        // 이메일 주소 (최대 100자)
        contactInfo.email := 'test@test.com';

        // 팩스번호 (최대 20자)
        contactInfo.fax := '02-6442-9799';

        // 조회권한, true(회사조회), false(개인조회)
        contactInfo.searchAllAllowYN := true;

        // 관리자권한 설정여부, true-관리자 / false-사용자
        contactInfo.mgrYN := false;

        try
                response := easyFinBankService.UpdateContact(txtCorpNum.text, contactInfo, txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TTfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        {**********************************************************************}
        { 연동회원의 회사정보를 확인합니다.                                    }
        {**********************************************************************}

        try
                corpInfo := easyFinBankService.GetCorpInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'CorpName (상호) : ' + corpInfo.CorpName + #13;
        tmp := tmp + 'CeoName (대표자성명) : ' + corpInfo.CeoName + #13;
        tmp := tmp + 'BizType (업태) : ' + corpInfo.BizType + #13;
        tmp := tmp + 'BizClass (종목) : ' + corpInfo.BizClass + #13;
        tmp := tmp + 'Addr (주소) : ' + corpInfo.Addr + #13;
        ShowMessage(tmp);
end;

procedure TTfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { 연동회원의 회사정보를 수정합니다.                                    }
        {**********************************************************************}

        corpInfo := TCorpInfo.Create;

        // 대표자명, 최대 30자
        corpInfo.ceoname := '대표자명';

        // 상호, 최대 70자
        corpInfo.corpName := '상호';

        // 업태, 최대 40자
        corpInfo.bizType := '업태';

        // 종목, 최대 40자
        corpInfo.bizClass := '종목';

        // 주소, 최대 300자
        corpInfo.addr := '서울특별시 강남구 영동대로 517';

        try
                response := easyFinBankService.UpdateCorpInfo(txtCorpNum.text, corpInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TTfrmExample.btnGetAccessURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        {    팝빌(www.popbill.com)에 로그인된 팝업 URL을 반환합니다.           }
        {    URL 보안정책에 따라 반환된 URL은 30초의 유효시간을 갖습니다.      }
        {**********************************************************************}

        try
                resultURL := easyFinBankService.getAccessURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('팝빌 로그인 URL' + #13 + resultURL);
end;

procedure TTfrmExample.btnGetFlatRatePopUpURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        {    정액제 서비스 신청 URL을 반환한다.
        {**********************************************************************}

        try
                resultURL := easyFinBankService.getFlatRatePopUpURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('정액제 신청 URL' + #13 + resultURL);
end;

procedure TTfrmExample.btnGetFlatRateStateClick(Sender: TObject);
var
        stateInfo : TEasyFinBankFlatRate;
        tmp, bankCode, accountNumber : String;
begin
        {**********************************************************************}
        { 정액제 서비스 상태를 확인합니다.                                     }
        {**********************************************************************}

        // 은행코드
        bankCode := '0000';

        // 은행 계좌번호
        accountNumber := '131020538600';

        try
                stateInfo := easyFinBankService.GetFlatRateState(txtCorpNum.text, bankCode, accountNumber);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'응답메시지 : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin

                tmp := 'referenceID (계좌 아이디) : ' + stateInfo.referenceID + #13;
                tmp := tmp + 'contractDT (정액제 서비스 시작일시) : ' + stateInfo.contractDT + #13;
                tmp := tmp + 'useEndDate (정액제 서비스 종료일시) : ' + stateInfo.useEndDate + #13;
                tmp := tmp + 'baseDate (자동연장 결제일) : ' + IntToStr(stateInfo.baseDate) + #13;
                tmp := tmp + 'state (정액제 서비스 상태) : ' + IntToStr(stateInfo.state) + #13;
                tmp := tmp + 'closeRequestYN (정액제 해지신청 여부) : ' + BoolToStr(stateInfo.closeRequestYN) + #13;
                tmp := tmp + 'useRestrictYN (정액제 사용제한 여부) : ' + BoolToStr(stateInfo.useRestrictYN) + #13;
                tmp := tmp + 'closeOnExpired (정액제 만료시 해지 여부) : ' + BoolToStr(stateInfo.closeOnExpired) + #13;
                tmp := tmp + 'unPaidYN (미수금 보유 여부) : ' + BoolToStr(stateInfo.unPaidYN) + #13;
                ShowMessage(tmp);
        end;
end;

procedure TTfrmExample.btnGetBankAccountMgtURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        {    계좌 관리 팝업 URL을 반환한다.
        {**********************************************************************}

        try
                resultURL := easyFinBankService.getBankAccountMgtURL(txtCorpNum.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('계좌 관리 팝업 URL' + #13 + resultURL);
end;

procedure TTfrmExample.btnListBankAccountClick(Sender: TObject);
var
        bankAccountList : TEasyFinBankAccountInfoList;
        tmp : String;
        i : Integer;
begin
        {************************************************************************}
        { 팝빌에 등록된 은행계좌 목록을 반환한다.
        {************************************************************************}

        try
                bankAccountList := easyFinBankService.ListBankAccount(txtCorpNum.text);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if easyFinBankService.LastErrCode <> 0 then
        begin

                ShowMessage('응답코드 : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'응답메시지 : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin        
                tmp := 'accountNumber(계좌번호) | bankCode(은행코드) | accountName(계좌 별칭) | accountType(계좌 유형) | ';
                tmp := tmp + 'state(계좌 정액제 상태) | memo(메모)' + #13 ;

                for i := 0 to Length(bankAccountList) -1 do
                begin
                    tmp := tmp + bankAccountList[i].accountNumber + ' | ';
                    tmp := tmp + bankAccountList[i].bankCode + ' | ';
                    tmp := tmp + bankAccountList[i].accountName + ' | ';
                    tmp := tmp + bankAccountList[i].accountType + ' | ';
                    tmp := tmp + IntToStr(bankAccountList[i].state) + ' | ';
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
        { 계좌 거래내역 수집을 요청한다.
        { - 검색기간은 현재일 기준 90일 이내로만 요청할 수 있다.
        {************************************************************************}

        // 은행코드
        bankCode := '0000';

        // 계좌번호
        accountNumber := '131020538600';

        // 시작일자, 날자형식(yyyyMMdd)
        SDate := '20191001';

        // 종료일자, 날자형식(yyyyMMdd)
        EDate := '20191223';

        try
                jobID := easyFinBankService.RequestJob(txtCorpNum.text, bankCode, accountNumber, SDate, EDate);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'응답메시지 : '+  easyFinBankService.LastErrMessage);
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
        { 수집요청에 대한 상태를 확인합니다.                                   }
        {**********************************************************************}

        try
                jobInfo := easyFinBankService.GetJobState(txtCorpNum.text, txtJobId.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'응답메시지 : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin
                tmp := 'jobID(작업아이디) : '+ jobInfo.jobID + #13;
                tmp := tmp + 'jobState(수집상태) : '+ IntToStr(jobInfo.jobState) + #13;
                tmp := tmp + 'startDate(시작일자) : ' + jobInfo.startDate + #13;
                tmp := tmp + 'endDate(종료일자) : ' + jobInfo.endDate + #13;
                tmp := tmp + 'errorCode(오류코드) : ' + IntToStr(jobInfo.errorCode) + #13;
                tmp := tmp + 'errorReason(오류메시지) : ' + jobInfo.errorReason + #13;
                tmp := tmp + 'jobStartDT(작업 시작일시) : ' + jobInfo.jobStartDT + #13;
                tmp := tmp + 'jobEndDT(작업 종료일시) : ' + jobInfo.jobEndDT + #13;
                tmp := tmp + 'regDT(수집 요청일시) : ' + jobInfo.regDT + #13 + #13;
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
        { 1시간 이내 수집 요청한 작업 상태를 확인합니다.         
        {************************************************************************}

        try
                jobList := easyFinBankService.ListActiveJob(txtCorpNum.text);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if easyFinBankService.LastErrCode <> 0 then
        begin

                ShowMessage('응답코드 : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'응답메시지 : '+  easyFinBankService.LastErrMessage);
        end
        else
        begin        
                tmp := 'jobID(작업아이디) | jobState(수집상태) | ';
                tmp := tmp + 'startDate (시작일자) | endDate(종료일자) | errorCode(오류코드) | errorReason(오류메시지) | ';
                tmp := tmp + 'jobStartDT(작업 시작일시) | jobEndDT(작업 종료일시) | regDT(수집 요청일시) ' + #13;

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
        { 계좌 거래내역을 조회한다.
        {**********************************************************************}

        // 과세형태 배열, I - 입금, O - 출금
        SetLength(tradeType, 2);
        tradeType[0] := 'I';
        tradeType[1] := 'O';

        // 페이지번호
        Page := 1;

        // 페이지당 검색개수
        PerPage := 10;

        // 정렬방향, D-내림차순, A-오름차순
        Order := 'D';
        
        // 조회 검색어, 입금/출금액, 메모, 적요 like 검색
        SearchString := '';

        try
                searchInfo := easyFinBankService.Search(txtCorpNum.text, txtJobId.text, TradeType, SearchString, Page, PerPage, Order, txtUserID.text);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;


        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'응답메시지 : '+  easyFinBankService.LastErrMessage);
                exit;
        end
        else
        begin

                tmp := 'code (응답코드) : ' + IntToStr(searchInfo.code) + #13;
                tmp := tmp + 'total (총 검색결과 건수) : ' + IntToStr(searchInfo.total) + #13;
                tmp := tmp + 'perPage (페이지당 검색개수) : ' + IntToStr(searchInfo.perPage) + #13;
                tmp := tmp + 'pageNum (페이지 번호) : ' + IntToStr(searchInfo.pageNum) + #13;
                tmp := tmp + 'pageCount (페이지 개수) : ' + IntToStr(searchInfo.pageCount)+ #13;
                tmp := tmp + 'message (응답 메시지) : ' + searchInfo.message + #13 + #13;

                for i := 0 to length(searchInfo.list) - 1 do
                begin
                        StringGrid1.Cells[0, i+1] := searchInfo.list[i].tid;          // 거래내역 아이디
                        StringGrid1.Cells[1, i+1] := searchInfo.list[i].trdate;       // 거래일자
                        StringGrid1.Cells[2, i+1] := IntToStr(searchInfo.list[i].trserial);     // 거래 일련번호
                        StringGrid1.Cells[3, i+1] := searchInfo.list[i].trdt;         // 거래일시
                        StringGrid1.Cells[4, i+1] := searchInfo.list[i].accIn;        // 입금액
                        StringGrid1.Cells[5, i+1] := searchInfo.list[i].accOut;       // 출금액
                        StringGrid1.Cells[6, i+1] := searchInfo.list[i].balance;      // 잔액
                        StringGrid1.Cells[7, i+1] := searchInfo.list[i].remark1;      // 비고1
                        StringGrid1.Cells[8, i+1] := searchInfo.list[i].remark2;      // 비고2
                        StringGrid1.Cells[9, i+1] := searchInfo.list[i].remark3;      // 비고3
                        StringGrid1.Cells[10, i+1] := searchInfo.list[i].remark4;     // 비고4
                        StringGrid1.Cells[11, i+1] := searchInfo.list[i].memo;        // 메모
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
        { 거래내역 요약정보를 조회한다.
        {************************************************************************}

        // 거래유형 배열, I-입금, O-출금
        SetLength(tradeType, 2);
        tradeType[0] := 'I';
        tradeType[1] := 'O';

        // 조회 검색어, 입금/출금액, 메모, 적요 like 검색
        SearchString := '';

        try
                summaryInfo := easyFinBankService.Summary(txtCorpNum.text, txtJobId.text, TradeType, SearchString, txtUserID.text);

        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if easyFinBankService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(easyFinBankService.LastErrCode) + #10#13 +'응답메시지 : '+  easyFinBankService.LastErrMessage);
                exit;
        end
        else
        begin
                tmp := 'count (수집 결과 건수) : ' + IntToStr(summaryInfo.count) + #13;
                tmp := tmp + 'cntAccIn (입금거래 건수) : ' + IntToStr(summaryInfo.cntAccIn) + #13;
                tmp := tmp + 'cntAccOut (출금거래 건수) : ' + IntToStr(summaryInfo.cntAccOut) + #13;
                tmp := tmp + 'totalAccIn (입금액 합계) : ' + IntToStr(summaryInfo.totalAccIn) + #13;
                tmp := tmp + 'totalAccOut (출금액 합계) : ' + IntToStr(summaryInfo.totalAccOut) + #13;

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
        { 계좌 거래내역에 메모를 저장한다.
        {**********************************************************************}

        // 메모
        Memo := '20191224-01-테스트한글';

        try
                response := easyFinBankService.SaveMemo(txtCorpNum.text, txtTID.text, Memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TTfrmExample.OnSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
        if StringGrid1.Cells[0, Arow] <> '' then
        begin
                txtTID.Text := StringGrid1.Cells[0, Arow];
        end

end;


end.
