object TfrmExample: TTfrmExample
  Left = 302
  Top = 195
  Width = 1139
  Height = 776
  Caption = '�˺� ���� ������ȸ Delphi SDK Example'
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
    Caption = '�˺�ȸ�� ����ڹ�ȣ : '
  end
  object Label4: TLabel
    Left = 320
    Top = 20
    Width = 81
    Height = 13
    AutoSize = False
    Caption = '�˺����̵� : '
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
    Height = 161
    Caption = '�˺� �⺻ API'
    TabOrder = 2
    object GroupBox9: TGroupBox
      Left = 8
      Top = 24
      Width = 137
      Height = 121
      Caption = 'ȸ������'
      TabOrder = 0
      object btnJoinMember: TButton
        Left = 8
        Top = 88
        Width = 120
        Height = 25
        Caption = 'ȸ�� ����'
        TabOrder = 0
        OnClick = btnJoinMemberClick
      end
      object btnCheckIsMember: TButton
        Left = 8
        Top = 24
        Width = 120
        Height = 25
        Caption = '���Կ���Ȯ��'
        TabOrder = 1
        OnClick = btnCheckIsMemberClick
      end
      object btnCheckID: TButton
        Left = 8
        Top = 56
        Width = 121
        Height = 25
        Caption = '���̵� �ߺ� Ȯ��'
        TabOrder = 2
        OnClick = btnCheckIDClick
      end
    end
    object GroupBox11: TGroupBox
      Left = 152
      Top = 24
      Width = 145
      Height = 121
      Caption = '����Ʈ ����'
      TabOrder = 1
      object btnGetChargeInfo: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = '�������� Ȯ��'
        TabOrder = 0
        OnClick = btnGetChargeInfoClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 608
      Top = 24
      Width = 145
      Height = 121
      Caption = '����� ����'
      TabOrder = 2
      object btnUpdateContact: TButton
        Left = 8
        Top = 88
        Width = 129
        Height = 25
        Caption = '����� ���� ����'
        TabOrder = 0
        OnClick = btnUpdateContactClick
      end
      object btnRegistContact: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = '����� �߰�'
        TabOrder = 1
        OnClick = btnRegistContactClick
      end
      object btnListContact: TButton
        Left = 8
        Top = 56
        Width = 129
        Height = 25
        Caption = '����� ��� ��ȸ'
        TabOrder = 2
        OnClick = btnListContactClick
      end
    end
    object GroupBox16: TGroupBox
      Left = 760
      Top = 24
      Width = 145
      Height = 121
      Caption = 'ȸ������ ����'
      TabOrder = 3
      object btnGetCorpInfo: TButton
        Left = 8
        Top = 24
        Width = 128
        Height = 25
        Caption = 'ȸ������ ��ȸ'
        TabOrder = 0
        OnClick = btnGetCorpInfoClick
      end
      object btnUpdateCorpInfo: TButton
        Left = 8
        Top = 56
        Width = 128
        Height = 25
        Caption = 'ȸ������ ����'
        TabOrder = 1
        OnClick = btnUpdateCorpInfoClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 912
      Top = 24
      Width = 153
      Height = 121
      Caption = '��Ÿ'
      TabOrder = 4
      object btnGetAccessURL: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = '�˺� �α��� URL'
        TabOrder = 0
        OnClick = btnGetAccessURLClick
      end
    end
    object GroupBox7: TGroupBox
      Left = 304
      Top = 24
      Width = 146
      Height = 121
      Caption = '�������� ����Ʈ'
      TabOrder = 5
      object btnGetChargeURL: TButton
        Left = 8
        Top = 56
        Width = 129
        Height = 25
        Caption = '����Ʈ���� URL'
        TabOrder = 0
        OnClick = btnGetChargeURLClick
      end
      object btnGetBalance: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = '�ܿ�����Ʈ Ȯ��'
        TabOrder = 1
        OnClick = btnGetBalanceClick
      end
    end
    object GroupBox10: TGroupBox
      Left = 456
      Top = 24
      Width = 147
      Height = 121
      Caption = '��Ʈ�ʰ��� ����Ʈ'
      TabOrder = 6
      object btnGetPartnerBalance: TButton
        Left = 8
        Top = 24
        Width = 129
        Height = 25
        Caption = '��Ʈ������Ʈ Ȯ��'
        TabOrder = 0
        OnClick = btnGetPartnerBalanceClick
      end
      object btnGetPartnerURL_CHRG: TButton
        Left = 8
        Top = 56
        Width = 129
        Height = 25
        Caption = '����Ʈ���� URL'
        TabOrder = 1
        OnClick = btnGetPartnerURL_CHRGClick
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 24
    Top = 224
    Width = 1081
    Height = 497
    Caption = '���� ������ȸ API'
    TabOrder = 3
    object Label2: TLabel
      Left = 16
      Top = 224
      Width = 143
      Height = 13
      Caption = '���� �۾� ���̵� (JobID) : '
    end
    object Label1: TLabel
      Left = 384
      Top = 224
      Width = 127
      Height = 13
      Caption = '�ŷ����� ���̵�(TID) : '
    end
    object GroupBox3: TGroupBox
      Left = 384
      Top = 24
      Width = 153
      Height = 153
      Caption = '���� ����'
      TabOrder = 0
      object btnGetBankAccountMgtURL: TButton
        Left = 8
        Top = 24
        Width = 137
        Height = 33
        Caption = '���� ���� �˾� URL'
        TabOrder = 0
        OnClick = btnGetBankAccountMgtURLClick
      end
      object btnListBankAccount: TButton
        Left = 8
        Top = 64
        Width = 137
        Height = 33
        Caption = '���� ��� Ȯ��'
        TabOrder = 1
        OnClick = btnListBankAccountClick
      end
    end
    object GroupBox5: TGroupBox
      Left = 16
      Top = 24
      Width = 161
      Height = 153
      Caption = '���� �ŷ����� ����'
      TabOrder = 1
      object btnRequestJob: TButton
        Left = 8
        Top = 24
        Width = 145
        Height = 33
        Caption = '���� ��û'
        TabOrder = 0
        OnClick = btnRequestJobClick
      end
      object btnGetJobState: TButton
        Left = 8
        Top = 64
        Width = 145
        Height = 33
        Caption = '���� ���� Ȯ��'
        TabOrder = 1
        OnClick = btnGetJobStateClick
      end
      object btnListActiveJob: TButton
        Left = 8
        Top = 104
        Width = 145
        Height = 33
        Caption = '���� ���� ��� Ȯ��'
        TabOrder = 2
        OnClick = btnListActiveJobClick
      end
    end
    object GroupBox6: TGroupBox
      Left = 192
      Top = 24
      Width = 177
      Height = 153
      Caption = '���� �ŷ����� ����'
      TabOrder = 2
      object btnSaveMemo: TButton
        Left = 8
        Top = 104
        Width = 161
        Height = 33
        Caption = '�ŷ� ���� �޸� ����'
        TabOrder = 0
        OnClick = btnSaveMemoClick
      end
      object btnSummary: TButton
        Left = 8
        Top = 64
        Width = 161
        Height = 33
        Caption = '�ŷ� ���� ������� ��ȸ'
        TabOrder = 1
        OnClick = btnSummaryClick
      end
      object btnSearch: TButton
        Left = 8
        Top = 24
        Width = 161
        Height = 33
        Caption = '�ŷ� ���� ��ȸ'
        TabOrder = 2
        OnClick = btnSearchClick
      end
    end
    object GroupBox12: TGroupBox
      Left = 552
      Top = 24
      Width = 169
      Height = 153
      Caption = '������ ����'
      TabOrder = 3
      object btnGetFlatRatePopUpURL: TButton
        Left = 8
        Top = 24
        Width = 153
        Height = 33
        Caption = '������ ���� ��û URL'
        TabOrder = 0
        OnClick = btnGetFlatRatePopUpURLClick
      end
      object btnGetFlatRateState: TButton
        Left = 8
        Top = 64
        Width = 153
        Height = 33
        Caption = '������ ���� ���� Ȯ��'
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
      TabOrder = 5
    end
    object txtTID: TEdit
      Left = 520
      Top = 221
      Width = 225
      Height = 21
      TabOrder = 6
    end
  end
end
