object EVInsideNavigator: TEVInsideNavigator
  Left = 0
  Top = 0
  Width = 1300
  Height = 200
  TabOrder = 0
  object pnlInsideRemoteCtrl: TPanel
    Left = 1000
    Top = 0
    Width = 300
    Height = 200
    Align = alRight
    TabOrder = 0
    ExplicitLeft = 1300
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
    object pnlFloorBtn: TPanel
      Left = 1
      Top = 38
      Width = 298
      Height = 130
      Align = alTop
      TabOrder = 0
      ExplicitTop = 34
    end
    object pnlDoorBtn: TPanel
      Left = 1
      Top = 169
      Width = 298
      Height = 30
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 158
      object btnOpenDoor: TButton
        Left = 1
        Top = 1
        Width = 175
        Height = 28
        Align = alLeft
        TabOrder = 0
        OnMouseDown = btnOpenDoorMouseDown
        OnMouseUp = btnOpenDoorMouseUp
      end
      object btnCloseDoor: TButton
        Left = 152
        Top = 1
        Width = 145
        Height = 28
        Align = alRight
        TabOrder = 1
        OnMouseDown = btnCloseDoorMouseDown
        OnMouseUp = btnCloseDoorMouseUp
        ExplicitLeft = 162
      end
    end
    object cbbEVSelector: TComboBox
      Left = 1
      Top = 17
      Width = 298
      Height = 21
      Align = alTop
      Style = csDropDownList
      TabOrder = 2
      ExplicitTop = 1
      ExplicitWidth = 296
    end
  end
end
