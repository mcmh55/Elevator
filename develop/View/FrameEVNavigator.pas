unit FrameEVNavigator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  IFrameNavigator, FrameFloorNavigator, Arrays;

type
  TEVInsideNavigator = class(TFrame, IFraNavigator)
    pnlInsideRemoteCtrl: TPanel;
    cbbEVSelector: TComboBox;
    lbCtrlName: TLabel;
    pnlFloorBtn: TPanel;
    pnlDoorBtn: TPanel;
    btnOpenDoor: TButton;
    btnCloseDoor: TButton;
    procedure btnOpenDoorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnOpenDoorMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCloseDoorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCloseDoorMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  private
    FEVNameArr: Arrays.TStringArray;
    FEVPnlWidth: Integer;
    FEVPnlHeight: Integer;

    FloorNavigator: TFloorNavigator;

    procedure InitEVPnlSize();
    procedure CreateNavigatorUI();
    {$REGION 'Documentation'}
    /// <summary>
    ///   배경 Panel 셋팅
    /// </summary>
    {$ENDREGION}
    procedure CreateBGPnls(EVBGPnl: TPanel; Left: Integer);
    procedure CreateNamePnls(NamePnl, ParentPnl: TPanel; Idx: Integer);
    procedure CreateMoveStatePnls(MoveStatePnl, ParentPnl: TPanel);
    procedure CreateLocationPnls(LocationPnl, ParentPnl: TPanel; Left: Integer);
    procedure CreateWeightStatePnls(WeightStatePnl, ParentPnl: TPanel; WeightStatePnlTop: Integer);
    procedure InitEVNameArr();

    // EVInsideCtrlUI
    procedure InitEVCtrlSelectorList();
    procedure InitEVCtrlFloorBtns();
    procedure InitEVCtrlDoorBtns();

  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  Constants;

{$R *.dfm}

procedure TEVInsideNavigator.btnCloseDoorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  btnCloseDoor.Caption := STATE_CLOSE_ON;
end;

procedure TEVInsideNavigator.btnCloseDoorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  btnCloseDoor.Caption := STATE_CLOSE_OFF;
end;

procedure TEVInsideNavigator.btnOpenDoorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  btnOpenDoor.Caption := STATE_OPEN_ON;
end;

procedure TEVInsideNavigator.btnOpenDoorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  btnOpenDoor.Caption := STATE_OPEN_OFF;
end;

constructor TEVInsideNavigator.Create(AOwner: TComponent);
begin
  inherited;

  FloorNavigator := FloorNavigator.GetInstance();

  InitEVPnlSize();
  InitEVNameArr();
  CreateNavigatorUI();

  InitEVCtrlSelectorList();
  InitEVCtrlFloorBtns();
  InitEVCtrlDoorBtns();
end;

procedure TEVInsideNavigator.CreateNamePnls(NamePnl, ParentPnl: TPanel;
  Idx: Integer);
begin
  NamePnl.Parent      := ParentPnl;
  NamePnl.Align       := alBottom;
  NamePnl.Height      := Trunc(ParentPnl.Height * 0.1);
  NamePnl.BorderStyle := bsSingle;
  NamePnl.Font.Style  := [fsBold];
  NamePnl.Caption     := FEVNameArr[Idx];
end;

procedure TEVInsideNavigator.CreateNavigatorUI;
const
  DISPLAY_PANEL_COUNT = 4;

var
  EVBGPnlArr, NamePnlArr, MoveStatePnlArr, LocationPnlArr, WeightStatePnlArr: array of TPanel;
  LocationPnlLeft, WeightStatePnlTop: Integer;
  PnlLeft: Integer;
  i: Integer;

begin
  SetLength(EVBGPnlArr, FLOOR_COUNT);
  SetLength(NamePnlArr, FLOOR_COUNT);
  SetLength(MoveStatePnlArr, FLOOR_COUNT);
  SetLength(LocationPnlArr, FLOOR_COUNT);
  SetLength(WeightStatePnlArr, FLOOR_COUNT);

  PnlLeft := 0;
  { TODO -cRefactoring : i를 엘리베이터 순서를 의미하는 것으로 변경 }
  for i := 0 to EV_COUNT - 1 do
  begin
    EVBGPnlArr[i]        := TPanel.Create(Self);
    NamePnlArr[i]        := TPanel.Create(Self);
    MoveStatePnlArr[i]   := TPanel.Create(Self);
    LocationPnlArr[i]    := TPanel.Create(Self);
    WeightStatePnlArr[i] := TPanel.Create(Self);

    CreateBGPnls(EVBGPnlArr[i], PnlLeft);
    CreateNamePnls(NamePnlArr[i], EVBGPnlArr[i], i);
    CreateMoveStatePnls(MoveStatePnlArr[i], EVBGPnlArr[i]);

    LocationPnlLeft := MoveStatePnlArr[i].Width;
    CreateLocationPnls(LocationPnlArr[i], EVBGPnlArr[i], LocationPnlLeft);

    WeightStatePnlTop := LocationPnlArr[i].Height;
    CreateWeightStatePnls(WeightStatePnlArr[i], EVBGPnlArr[i], WeightStatePnlTop);

    PnlLeft := PnlLeft + FEVPnlWidth;
  end;
end;

procedure TEVInsideNavigator.CreateWeightStatePnls(WeightStatePnl, ParentPnl: TPanel; WeightStatePnlTop: Integer);
begin
  WeightStatePnl.Parent  := ParentPnl;
  WeightStatePnl.Top     := WeightStatePnlTop;
  WeightStatePnl.Width   := ParentPnl.Width;
  WeightStatePnl.Height  := Trunc(ParentPnl.Height * 0.7);
  WeightStatePnl.Caption := 'Wieght = 0.00';
end;

procedure TEVInsideNavigator.InitEVCtrlDoorBtns;
begin
  btnOpenDoor.Caption  := STATE_OPEN_OFF;
  btnCloseDoor.Caption := STATE_CLOSE_OFF;
end;

procedure TEVInsideNavigator.InitEVCtrlFloorBtns;
var
  btnFloor: TButton;
  btnFloorWidth, btnFloorHeight: Integer;
  Left, Top: Integer;
  i: Integer;

begin
  btnFloorWidth  := Trunc(pnlFloorBtn.Width * 0.2);
  btnFloorHeight := Trunc(pnlFloorBtn.Height * 0.25);

  Left := 0;
  Top  := pnlFloorBtn.Height;

  for i := 0 to FLOOR_COUNT - 1 do
  begin
    if i mod 5 = 0 then
    begin
      Left := 0;
      Top  := Top - btnFloorHeight;
    end;

    btnFloor := TButton.Create(Self);
    btnFloor.Parent     := pnlFloorBtn;
    btnFloor.Left       := Left;
    btnFloor.Top        := Top;
    btnFloor.Width      := btnFloorWidth;
    btnFloor.Height     := btnFloorHeight;
    btnFloor.Caption    := FloorNavigator.FloorNameArr[i];
    btnFloor.Font.Color := clGray;

    Left := Left + btnFloor.Width;
  end;
end;

procedure TEVInsideNavigator.InitEVNameArr;
var
  i: Integer;

begin
  SetLength(FEVNameArr, EV_COUNT);

  for i := 0 to Length(FEVNameArr) - 1 do
    FEVNameArr[i] := 'EV' + IntToStr(i);
end;

procedure TEVInsideNavigator.InitEVPnlSize;
begin
  FEVPnlWidth  := Trunc(Self.Width / EV_COUNT);
  FEVPnlHeight := 200;
end;

procedure TEVInsideNavigator.InitEVCtrlSelectorList;
var
  EVName: string;

begin
  for EVName in FEVNameArr do
    cbbEVSelector.Items.Append(EVName);

  cbbEVSelector.ItemIndex := 0;
end;

procedure TEVInsideNavigator.CreateBGPnls(EVBGPnl: TPanel; Left: Integer);
begin
  EVBGPnl.Parent := Self;
  EVBGPnl.Left   := Left;
  EVBGPnl.Width  := FEVPnlWidth;
  EVBGPnl.Height := FEVPnlHeight;
end;

procedure TEVInsideNavigator.CreateLocationPnls(LocationPnl, ParentPnl: TPanel; Left: Integer);
begin
  LocationPnl.Parent := ParentPnl;
  LocationPnl.Left   := Left;
  LocationPnl.Width  := Trunc(ParentPnl.Width * 0.8);
  LocationPnl.Height := Trunc(ParentPnl.Height * 0.2);
end;

procedure TEVInsideNavigator.CreateMoveStatePnls(MoveStatePnl,
  ParentPnl: TPanel);
begin
  MoveStatePnl.Parent := ParentPnl;
  MoveStatePnl.Width  := Trunc(ParentPnl.Width * 0.2);
  MoveStatePnl.Height := Trunc(ParentPnl.Height * 0.2);
end;

end.
