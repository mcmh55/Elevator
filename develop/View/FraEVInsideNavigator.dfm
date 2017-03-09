object EVInsideNavigator: TEVInsideNavigator
  Left = 0
  Top = 0
  Width = 1500
  Height = 250
  TabOrder = 0
  object pnlInsideNaviArea1: TPanel
    Left = 0
    Top = 0
    Width = 200
    Height = 250
    TabOrder = 0
    object pnlInsideNaviTop1: TPanel
      Left = 1
      Top = 1
      Width = 198
      Height = 30
      Align = alTop
      TabOrder = 0
      object pnlUpDownState: TPanel
        Left = 1
        Top = 1
        Width = 50
        Height = 28
        Align = alLeft
        BevelOuter = bvNone
        BorderStyle = bsSingle
        TabOrder = 0
      end
      object pnlCurrentFloor: TPanel
        Left = 51
        Top = 1
        Width = 146
        Height = 28
        Align = alClient
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Ctl3D = True
        DoubleBuffered = False
        ParentBackground = False
        ParentCtl3D = False
        ParentDoubleBuffered = False
        TabOrder = 1
      end
    end
  end
  object pnlInsideRemoteCtrl: TPanel
    Left = 1200
    Top = 0
    Width = 300
    Height = 250
    Align = alRight
    TabOrder = 1
    ExplicitLeft = 151
    object comboxInsideNaviSelector: TComboBox
      Left = 1
      Top = 1
      Width = 298
      Height = 21
      Align = alTop
      Style = csDropDownList
      TabOrder = 0
    end
    object btnOpenDoor: TButton
      Left = 1
      Top = 225
      Width = 150
      Height = 25
      Caption = #9664'   '#9654
      TabOrder = 1
    end
    object btnCloseDoor: TButton
      Left = 150
      Top = 225
      Width = 150
      Height = 25
      Caption = #9654'   '#9664
      TabOrder = 2
    end
  end
end
