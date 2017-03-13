object EVInsideNavigator: TEVInsideNavigator
  Left = 0
  Top = 0
  Width = 1600
  Height = 200
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
    Left = 1300
    Top = 0
    Width = 300
    Height = 200
    Align = alRight
    TabOrder = 1
    ExplicitLeft = 1200
    ExplicitHeight = 250
    object lbCtrlName: TLabel
      Left = 1
      Top = 1
      Width = 298
      Height = 16
      Align = alTop
      Alignment = taCenter
      Caption = '['#50648#47532#48288#51060#53552' '#45236#48512' '#52968#53944#47204']'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 128
    end
    object comboxInsideNaviSelector: TComboBox
      Left = 1
      Top = 17
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
      Caption = #9665' '#9655
      TabOrder = 1
      OnMouseDown = btnOpenDoorMouseDown
      OnMouseUp = btnOpenDoorMouseUp
    end
    object btnCloseDoor: TButton
      Left = 150
      Top = 225
      Width = 150
      Height = 25
      Caption = #9655' '#9665
      TabOrder = 2
      OnMouseDown = btnCloseDoorMouseDown
      OnMouseUp = btnCloseDoorMouseUp
    end
  end
end
