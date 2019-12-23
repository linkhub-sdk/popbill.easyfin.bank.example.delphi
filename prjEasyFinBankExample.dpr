program prjEasyFinBankExample;

uses
  Forms,
  Example in 'Example.pas' {Form1},
  Popbill in 'Popbill\Popbill.pas',
  Linkhub in 'Linkhub\Linkhub.pas',
  PopbillEasyFinBank in 'PopbillEasyFinBank\PopbillEasyFinBank.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
