object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'FrmMain'
  ClientHeight = 817
  ClientWidth = 1599
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
    Top = 617
    Width = 1599
    Height = 200
    Align = alBottom
    TabOrder = 0
    inherited pnlInsideNaviArea1: TPanel
      TabOrder = 1
    end
    inherited pnlInsideRemoteCtrl: TPanel
      Left = 1299
      TabOrder = 2
      ExplicitLeft = 1300
      ExplicitHeight = 200
    end
  end
  inline TopNavigatorArea: TTopNavigatorArea
    Left = -1
    Top = 0
    Width = 1600
    Height = 600
    TabOrder = 1
    ExplicitLeft = -1
    inherited FloorNavigator: TFloorNavigator
      TabOrder = 2
    end
    inherited EVLocationNavagator: TEVLocationNavagator
      TabOrder = 3
    end
  end
end
