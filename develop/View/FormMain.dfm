object FrmMain: TFrmMain
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'FrmMain'
  ClientHeight = 667
  ClientWidth = 1499
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
  inline EVInsideNavigator: TEVInsideNavigator
    Left = 0
    Top = 417
    Width = 1499
    Height = 250
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 417
    ExplicitWidth = 1499
    inherited pnlInsideNaviArea1: TPanel
      TabOrder = 1
    end
    inherited pnlInsideRemoteCtrl: TPanel
      Left = 1199
      TabOrder = 0
      ExplicitLeft = 1199
    end
  end
  inline FloorNavigator: TFloorNavigator
    Left = 0
    Top = 0
    Width = 1499
    Height = 400
    Align = alTop
    Color = clInactiveBorder
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    ExplicitWidth = 1499
  end
end
