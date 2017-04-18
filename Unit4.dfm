object Form4: TForm4
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Importuj dane'
  ClientHeight = 277
  ClientWidth = 291
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 213
    Width = 39
    Height = 13
    Caption = #346'cie'#380'ka:'
  end
  object RadioGroup1: TRadioGroup
    Left = 16
    Top = 16
    Width = 113
    Height = 57
    Caption = #377'r'#243'd'#322'o'
    Items.Strings = (
      'MS Access'
      'MS Excel')
    TabOrder = 0
    OnClick = RadioGroup1Click
  end
  object RadioGroup2: TRadioGroup
    Left = 135
    Top = 16
    Width = 138
    Height = 57
    Caption = 'Opcje'
    Items.Strings = (
      'Utw'#243'rz now'#261' list'#281
      'Dodaj do istniej'#261'cej')
    TabOrder = 1
  end
  object RadioGroup3: TRadioGroup
    Left = 16
    Top = 151
    Width = 257
    Height = 58
    Caption = 'Lista'
    Items.Strings = (
      'Lista nauczycieli'
      'Lista szk'#243#322)
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 16
    Top = 232
    Width = 169
    Height = 21
    ParentShowHint = False
    ReadOnly = True
    ShowHint = False
    TabOrder = 4
    OnClick = Edit1Click
  end
  object BitBtn1: TBitBtn
    Left = 191
    Top = 230
    Width = 82
    Height = 25
    Caption = 'OK'
    Enabled = False
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      E4F1E300860200951A0097176BCD8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF65BB784EE49D64EDB26DF2BA07B35051
      C175FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      009F3268FFD366FFC64FFFBE54FFC802B95541B766FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFBBD6B800CB622FFFB52FFFAF20FFAA00FF9E0D
      FFA800B74E30AE56FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF409643
      00FE9500FF9B00FE9900FC991FF8A12FF09D4CF2A800AB401EA647FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF00901500F38A2BF29D50F8B384D69E4EE59B69
      EEB06DE7AB75E8AC049D310D9C37FFFFFFFFFFFFFFFFFFFFFFFFA8C8A100BF48
      57EAA561EDAC3ACE78FFFFFFEDF4EB52D2877AE5AD80DFA894E4B2169A34008F
      24FFFFFFFFFFFFFFFFFF8DCC9543DB8B64E19F68E7A886CE95FFFFFFFFFFFFF2
      F3EB63C77F8FDFAE92DAA8AFE2BB2F9F43008312FFFFFFFFFFFFFFFFFFB0D9B3
      6DCA8736BD62E8EEE1FFFFFFFFFFFFFFFFFFF5F6F174C482A5DDB4A6D9AFC6E4
      C64FA95A007600F9FBF6FFFFFFFFFFFFFFFFFFFCF9F7FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFAFAF881C386BCDFBEBBDCBAD9EBD667B36F58AC64FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFCFA8EC58DD3E9
      D3D8EBD7BADBBAE0EFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF98CB98ABD3ABECF5ECFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 79
    Width = 257
    Height = 66
    Caption = 'Tekst'
    Enabled = False
    TabOrder = 2
    object Label2: TLabel
      Left = 16
      Top = 21
      Width = 70
      Height = 13
      Caption = 'Znak tabulacji:'
    end
    object Label3: TLabel
      Left = 119
      Top = 21
      Width = 92
      Height = 13
      Caption = 'Ogranicznik tekstu:'
    end
    object Edit2: TEdit
      Left = 16
      Top = 32
      Width = 70
      Height = 21
      MaxLength = 1
      TabOrder = 0
    end
    object Edit3: TEdit
      Left = 119
      Top = 32
      Width = 74
      Height = 21
      MaxLength = 1
      TabOrder = 1
    end
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Filter = 'pliki tekstowe|*.txt'
    Left = 128
    Top = 184
  end
end
