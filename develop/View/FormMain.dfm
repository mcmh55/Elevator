object FrmMain: TFrmMain
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'FrmMain'
  ClientHeight = 817
  ClientWidth = 1600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  inline TopNavigatorArea: TTopNavigatorArea
    Left = 0
    Top = 0
    Width = 1600
    Height = 600
    AutoScroll = True
    TabOrder = 0
  end
  inline EVInsideNavigator: TEVInsideNavigator
    Left = 0
    Top = 617
    Width = 1600
    Height = 200
    TabOrder = 1
    ExplicitTop = 617
  end
end
