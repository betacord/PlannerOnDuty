object Form5: TForm5
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Podgl'#261'd wydruku'
  ClientHeight = 662
  ClientWidth = 863
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 842
    Height = 595
    Proportional = True
  end
  object Label1: TLabel
    Left = 0
    Top = 642
    Width = 863
    Height = 20
    Align = alBottom
    Alignment = taCenter
    Caption = 'Strona'
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    ExplicitLeft = -8
    ExplicitTop = 504
    ExplicitWidth = 722
  end
  object BitBtn1: TBitBtn
    Left = 344
    Top = 609
    Width = 91
    Height = 25
    Caption = 'Poprzednia'
    Enabled = False
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF94B493FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFB4C8B083B993FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5C6AE46C18D5CB282FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFAEC4AA46BB8712B2706FBD92C1D1BCB8CEB7B8CEB7B8CFB8B7CFB8B7D0
      B9B7D0B9B8D2BAAECAB0FFFFFFFFFFFFA7C3A63DB67F1DAD6F25B3772ABB8026
      BE8025BD8026BA7E26B67A27B27727AE7328A96F28A66D2B9458FFFFFF9FC0A1
      33AE751DA66926AD7124B07423B37523B57723B57723B27523AF7325AD7025A8
      6D27A46A26A1672C92579BC3A331AA702BA46C34AC7535B07936B47C36B67E35
      B77F34B67E33B57C32B1792EAD7429A76D23A066239E632A90559BC2A252B686
      58B58959B98C58BB8D58BD8F58BF9058C09158C09158BF9158BD8F59BB8E5AB9
      8D59B68A51B0823D9862FFFFFF98BE9D69C19772C19C72C39D72C59E71C69F71
      C69F71C69F71C59E72C49D72C39D72C19B72BE9975BF9B62A97CFFFFFFFFFFFF
      9BBF9F82CBA88DCDAE8CCDAE8FD2B38CD1B28CD1B28CD1B28CD0B18CCFB08CCD
      AF8CCCAE8FCDB071B189FFFFFFFFFFFFFFFFFF9EC0A19CD5B9ABD9C488C4A0AF
      CDB4ABCCB1ABCCB2ABCCB2ABCCB2ABCCB2ABCCB2ACCDB3A5C6AAFFFFFFFFFFFF
      FFFFFFFFFFFFA0C0A2B7E1CD8FC09FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7C5A98FBD9BFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF92B491FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 441
    Top = 609
    Width = 91
    Height = 25
    BiDiMode = bdLeftToRight
    Caption = 'Nast'#281'pna'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF94B493FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF83B993B4C8B0FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF5CB28146C08CB5C6AEFFFFFFFFFFFFFFFFFFFFFFFFAECAB0B8D1BA
      B7D0B9B7D0B8B8CFB8B8CFB8B8CEB7B8CEB7C1D1BC6FBD9212B16F46BB86AEC5
      AAFFFFFFFFFFFFFFFFFF2A955928A86E27AA7027AF7426B37726B77A26BB7E25
      BE8026BD802BBB7F25B2761EAC6E3DB57EA7C3A6FFFFFFFFFFFF2C935826A268
      27A56B25A96E25AD7123B07423B37623B57723B47723B27524AF7326AC701DA5
      6834AD749FC1A1FFFFFF2A9155239F6423A26628A86D2EAE7431B27933B57D34
      B67E35B77F36B57E36B37B35AF7834AC742BA36B31A9709BC3A33D996250B182
      5AB78B5ABA8D58BB8E58BE9058BF9158C09158C09158BF9058BD8F58BA8D59B8
      8B58B58852B6869BC2A362A97D75BF9B72BF9972C19B72C39D71C59E71C59F71
      C69F71C69F71C59F72C49D72C39C72C09B69C19698BE9DFFFFFF71B1898FCEB0
      8CCCAE8CCEAF8CCFB18CD0B18CD1B28CD1B28CD1B28FD1B38CCDAE8DCCAE82CB
      A89BBF9FFFFFFFFFFFFFA5C6AAACCDB3ABCCB2ABCCB2ABCCB2ABCCB2ABCCB2AB
      CCB1AFCDB488C4A0ACD9C49CD5B99EC0A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FC09FB7E1CDA0C0A2FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF8FBD9BA7C5A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF92B491FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    Layout = blGlyphRight
    ParentBiDiMode = False
    TabOrder = 1
    OnClick = BitBtn2Click
  end
end