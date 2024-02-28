object TfrmExample: TTfrmExample
  Left = 711
  Top = 182
  Caption = #54045#48716' '#44036#54200' '#44228#51340#51312#54924' Delphi SDK Example'
  ClientHeight = 738
  ClientWidth = 1123
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 32
    Top = 20
    Width = 129
    Height = 13
    AutoSize = False
    Caption = #54045#48716#54924#50896' '#49324#50629#51088#48264#54840' : '
  end
  object Label4: TLabel
    Left = 320
    Top = 20
    Width = 81
    Height = 13
    AutoSize = False
    Caption = #54045#48716#50500#51060#46356' : '
  end
  object Label5: TLabel
    Left = 768
    Top = 20
    Width = 41
    Height = 13
    AutoSize = False
    Caption = 'URL : '
  end
  object txtCorpNum: TEdit
    Left = 160
    Top = 16
    Width = 137
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 0
    Text = '1234567890'
  end
  object txtUserID: TEdit
    Left = 400
    Top = 16
    Width = 137
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 1
    Text = 'testkorea'
  end
  object GroupBox8: TGroupBox
    Left = 24
    Top = 48
    Width = 1081
    Height = 185
    Caption = #54045#48716' '#44592#48376' API'
    TabOrder = 2
    object GroupBox9: TGroupBox
      Left = 8
      Top = 24
      Width = 137
      Height = 121
      Caption = #54924#50896#44032#51077
      TabOrder = 0
      object btnJoinMember: TButton
        Left = 8
        Top = 88
        Width = 120
        Height = 25
        Caption = #54924#50896' '#44032#51077
        TabOrder = 0
        OnClick = btnJoinMemberClick
      end
      object btnCheckIsMember: TButton
        Left = 8
        Top = 24
        Width = 120
        Height = 25
        Caption = #44032#51077#50668#48512#54869#51064
        TabOrder = 1
        OnClick = btnCheckIsMemberClick
      end
      object btnCheckID: TButton
        Left = 8
        Top = 56
        Width = 121
        Height = 25
        Caption = #50500#51060#46356' '#51473#48373' '#54869#51064
        TabOrder = 2
        OnClick = btnCheckIDClick
      end
    end
    object GroupBox11: TGroupBox
      Left = 152
      Top = 24
      Width = 145
      Height = 121
      Caption = #54252#51064#53944' '#44288#47144
      TabOrder = 1
      object btnGetChargeInfo: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = #44284#44552#51221#48372' '#54869#51064
        TabOrder = 0
        OnClick = btnGetChargeInfoClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 608
      Top = 24
      Width = 145
      Height = 153
      Caption = #45812#45817#51088' '#44288#47144
      TabOrder = 2
      object btnUpdateContact: TButton
        Left = 8
        Top = 120
        Width = 129
        Height = 25
        Caption = #45812#45817#51088' '#51221#48372' '#49688#51221
        TabOrder = 0
        OnClick = btnUpdateContactClick
      end
      object btnRegistContact: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = #45812#45817#51088' '#52628#44032
        TabOrder = 1
        OnClick = btnRegistContactClick
      end
      object btnListContact: TButton
        Left = 8
        Top = 88
        Width = 129
        Height = 25
        Caption = #45812#45817#51088' '#47785#47197' '#51312#54924
        TabOrder = 2
        OnClick = btnListContactClick
      end
      object btnGetContactInfo: TButton
        Left = 8
        Top = 56
        Width = 129
        Height = 25
        Caption = #45812#45817#51088' '#51221#48372' '#54869#51064
        TabOrder = 3
        OnClick = btnGetContactInfoClick
      end
    end
    object GroupBox16: TGroupBox
      Left = 760
      Top = 24
      Width = 145
      Height = 121
      Caption = #54924#49324#51221#48372' '#44288#47144
      TabOrder = 3
      object btnGetCorpInfo: TButton
        Left = 8
        Top = 24
        Width = 128
        Height = 25
        Caption = #54924#49324#51221#48372' '#51312#54924
        TabOrder = 0
        OnClick = btnGetCorpInfoClick
      end
      object btnUpdateCorpInfo: TButton
        Left = 8
        Top = 56
        Width = 128
        Height = 25
        Caption = #54924#49324#51221#48372' '#49688#51221
        TabOrder = 1
        OnClick = btnUpdateCorpInfoClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 912
      Top = 24
      Width = 153
      Height = 121
      Caption = #44592#53440
      TabOrder = 4
      object btnGetAccessURL: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = #54045#48716' '#47196#44536#51064' URL'
        TabOrder = 0
        OnClick = btnGetAccessURLClick
      end
    end
    object GroupBox7: TGroupBox
      Left = 304
      Top = 24
      Width = 146
      Height = 121
      Caption = #50672#46041#44284#44552' '#54252#51064#53944
      TabOrder = 5
      object btnGetChargeURL: TButton
        Left = 8
        Top = 56
        Width = 129
        Height = 25
        Caption = #54252#51064#53944#52649#51204' URL'
        TabOrder = 0
        OnClick = btnGetChargeURLClick
      end
      object btnGetBalance: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = #51092#50668#54252#51064#53944' '#54869#51064
        TabOrder = 1
        OnClick = btnGetBalanceClick
      end
    end
    object GroupBox10: TGroupBox
      Left = 456
      Top = 24
      Width = 147
      Height = 153
      Caption = #54028#53944#45320#44284#44552' '#54252#51064#53944
      TabOrder = 6
      object btnGetPartnerBalance: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = #54028#53944#45320#54252#51064#53944' '#54869#51064
        TabOrder = 0
        OnClick = btnGetPartnerBalanceClick
      end
      object btnGetPartnerURL_CHRG: TButton
        Left = 8
        Top = 56
        Width = 129
        Height = 25
        Caption = #54252#51064#53944#52649#51204' URL'
        TabOrder = 1
        OnClick = btnGetPartnerURL_CHRGClick
      end
      object btnGetPaymentURL: TButton
        Left = 8
        Top = 88
        Width = 129
        Height = 25
        Caption = #54252#51064#53944' '#44208#51228#45236#50669' URL'
        TabOrder = 2
        OnClick = btnGetPaymentURLClick
      end
      object btnGetUseHistoryURL: TButton
        Left = 8
        Top = 120
        Width = 129
        Height = 25
        Caption = #54252#51064#53944' '#49324#50857#45236#50669' URL'
        TabOrder = 3
        OnClick = btnGetUseHistoryURLClick
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 24
    Top = 240
    Width = 1081
    Height = 481
    Caption = #44036#54200' '#44228#51340#51312#54924' API'
    TabOrder = 3
    object Label2: TLabel
      Left = 16
      Top = 224
      Width = 129
      Height = 13
      Caption = #49688#51665' '#51089#50629' '#50500#51060#46356' (JobID) : '
    end
    object Label1: TLabel
      Left = 384
      Top = 224
      Width = 113
      Height = 13
      Caption = #44144#47000#45236#50669' '#50500#51060#46356'(TID) : '
    end
    object GroupBox3: TGroupBox
      Left = 368
      Top = 24
      Width = 433
      Height = 153
      Caption = #44228#51340' '#44288#47532
      TabOrder = 0
      object btnGetBankAccountMgtURL: TButton
        Left = 296
        Top = 24
        Width = 125
        Height = 33
        Caption = #44228#51340' '#44288#47532' '#54045#50629' URL'
        TabOrder = 0
        OnClick = btnGetBankAccountMgtURLClick
      end
      object btnListBankAccount: TButton
        Left = 136
        Top = 24
        Width = 151
        Height = 33
        Caption = #44228#51340' '#47785#47197' '#54869#51064
        TabOrder = 1
        OnClick = btnListBankAccountClick
      end
      object btnRegistBankAccount: TButton
        Left = 8
        Top = 24
        Width = 122
        Height = 33
        Caption = #44228#51340' '#46321#47197
        TabOrder = 2
        OnClick = btnRegistBankAccountClick
      end
      object btnUpdateBankAccount: TButton
        Left = 8
        Top = 64
        Width = 122
        Height = 33
        Caption = #44228#51340#51221#48372' '#49688#51221
        TabOrder = 3
        OnClick = btnUpdateBankAccountClick
      end
      object btnGetBankAccountInfo: TButton
        Left = 8
        Top = 104
        Width = 121
        Height = 33
        Caption = #44228#51340#51221#48372' '#54869#51064
        TabOrder = 4
        OnClick = btnGetBankAccountInfoClick
      end
      object btnCloseBankAccount: TButton
        Left = 136
        Top = 64
        Width = 153
        Height = 33
        Caption = #44228#51340' '#51221#50529#51228' '#54644#51648#49888#52397
        TabOrder = 5
        OnClick = btnCloseBankAccountClick
      end
      object btnRevokeCloseBankAccount: TButton
        Left = 136
        Top = 104
        Width = 153
        Height = 33
        Caption = #44228#51340' '#51221#50529#51228' '#54644#51648#49888#52397' '#52712#49548
        TabOrder = 6
        OnClick = btnRevokeCloseBankAccountClick
      end
      object btnDeleteBankAccount: TButton
        Left = 296
        Top = 64
        Width = 125
        Height = 33
        Caption = #51333#47049#51228' '#44228#51340' '#49325#51228
        TabOrder = 7
        OnClick = btnDeleteBankAccountClick
      end
    end
    object GroupBox5: TGroupBox
      Left = 16
      Top = 24
      Width = 161
      Height = 153
      Caption = #44228#51340' '#44144#47000#45236#50669' '#49688#51665
      TabOrder = 1
      object btnRequestJob: TButton
        Left = 8
        Top = 24
        Width = 145
        Height = 33
        Caption = #49688#51665' '#50836#52397
        TabOrder = 0
        OnClick = btnRequestJobClick
      end
      object btnGetJobState: TButton
        Left = 8
        Top = 64
        Width = 145
        Height = 33
        Caption = #49688#51665' '#49345#53468' '#54869#51064
        TabOrder = 1
        OnClick = btnGetJobStateClick
      end
      object btnListActiveJob: TButton
        Left = 8
        Top = 104
        Width = 145
        Height = 33
        Caption = #49688#51665' '#49345#53468' '#47785#47197' '#54869#51064
        TabOrder = 2
        OnClick = btnListActiveJobClick
      end
    end
    object GroupBox6: TGroupBox
      Left = 184
      Top = 24
      Width = 177
      Height = 153
      Caption = #44228#51340' '#44144#47000#45236#50669' '#44288#47532
      TabOrder = 2
      object btnSaveMemo: TButton
        Left = 8
        Top = 104
        Width = 161
        Height = 33
        Caption = #44144#47000' '#45236#50669' '#47700#47784' '#51200#51109
        TabOrder = 0
        OnClick = btnSaveMemoClick
      end
      object btnSummary: TButton
        Left = 8
        Top = 64
        Width = 161
        Height = 33
        Caption = #44144#47000' '#45236#50669' '#50836#50557#51221#48372' '#51312#54924
        TabOrder = 1
        OnClick = btnSummaryClick
      end
      object btnSearch: TButton
        Left = 8
        Top = 24
        Width = 161
        Height = 33
        Caption = #44144#47000' '#45236#50669' '#51312#54924
        TabOrder = 2
        OnClick = btnSearchClick
      end
    end
    object GroupBox12: TGroupBox
      Left = 808
      Top = 24
      Width = 169
      Height = 153
      Caption = #51221#50529#51228' '#44288#47532
      TabOrder = 3
      object btnGetFlatRatePopUpURL: TButton
        Left = 8
        Top = 24
        Width = 153
        Height = 33
        Caption = #51221#50529#51228' '#49436#48708#49828' '#49888#52397' URL'
        TabOrder = 0
        OnClick = btnGetFlatRatePopUpURLClick
      end
      object btnGetFlatRateState: TButton
        Left = 8
        Top = 64
        Width = 153
        Height = 33
        Caption = #51221#50529#51228' '#49436#48708#49828' '#49345#53468' '#54869#51064
        TabOrder = 1
        OnClick = btnGetFlatRateStateClick
      end
    end
    object StringGrid1: TStringGrid
      Left = 16
      Top = 248
      Width = 1049
      Height = 233
      ColCount = 12
      FixedCols = 0
      TabOrder = 4
      OnSelectCell = OnSelectCell
      ColWidths = (
        206
        64
        35
        64
        64
        64
        64
        64
        64
        64
        64
        191)
      RowHeights = (
        24
        24
        24
        24
        24)
    end
    object txtJobID: TEdit
      Left = 160
      Top = 221
      Width = 193
      Height = 21
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      TabOrder = 5
    end
    object txtTID: TEdit
      Left = 520
      Top = 221
      Width = 225
      Height = 21
      ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
      TabOrder = 6
    end
  end
  object txtURL: TEdit
    Left = 808
    Top = 16
    Width = 297
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 4
  end
end
