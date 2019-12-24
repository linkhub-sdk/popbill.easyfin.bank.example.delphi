program prjEasyFinBankExample;

uses
  Forms,
  Example in 'Example.pas' {TfrmExample},
  Popbill in 'Popbill\Popbill.pas',
  Linkhub in 'Linkhub\Linkhub.pas',
  PopbillEasyFinBank in 'PopbillEasyFinBank\PopbillEasyFinBank.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TTfrmExample, TfrmExample);
  Application.Run;
end.
