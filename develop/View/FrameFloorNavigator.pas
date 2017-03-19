unit FrameFloorNavigator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFloorNavigator = class(TFrame)
  private
    FFloorNameArr: array of string;
    FNaviPnlWidth: Integer;
    FNaviPnlHeight: Integer;

    procedure InitFloorPnlSize();
    procedure CreateNavigatorUI();
    procedure CreateFloorBGPnls(FloorBGPnl: TPanel; Top: Integer);
    procedure CreateNaviBGPnls(NaviBGPnl, ParentPnl: TPanel; FloorIdx, NaviIdx, Left, Top: Integer);
    procedure CreateNamePnls(NamePnl, ParentPnl: TPanel; Idx: Integer);
    procedure CreateUpBtns(UpBtn: TButton; ParentPnl: TPanel);
    procedure CreateDownBtns(DownBtn: TButton; ParentPnl: TPanel);
    procedure CreateEVStatePnl(EVStatePnl, ParentPnl: TPanel);
    procedure InitFloorNameArr();

  public
    constructor Create(AOwner: TComponent); override;

    procedure UpBtnClick(Sender: TObject);
    procedure DownBtnClick(Sender: TObject);

    property FloorPnlWidth: Integer read FNaviPnlWidth write FNaviPnlWidth;
    property FloorPnlHeight: Integer read FNaviPnlHeight write FNaviPnlHeight;
  end;

implementation

uses
  Constants,
  CodeSiteLogging;

{$R *.dfm}

{ TFrame1 }

constructor TFloorNavigator.Create(AOwner: TComponent);
begin
  inherited;

  InitFloorPnlSize();
  InitFloorNameArr();
  CreateNavigatorUI();
end;

procedure TFloorNavigator.CreateNavigatorUI;
var
  FloorBGPnlArr, NaviBGPnlArr, NamePnlArr, EVStatePnlArr: array of TPanel;
  UpBtnArr, DownBtnArr: array of TButton;
  PnlLeft, PnlTop : Integer;
  i, j: Integer;

begin
  SetLength(FloorBGPnlArr, FLOOR_COUNT);
  SetLength(NaviBGPnlArr, FLOOR_COUNT);
  SetLength(NamePnlArr, FLOOR_COUNT);
  SetLength(EVStatePnlArr, FLOOR_COUNT);
  SetLength(UpBtnArr, FLOOR_COUNT);
  SetLength(DownBtnArr, FLOOR_COUNT);

  PnlLeft := 0;
  PnlTop  := FNaviPnlHeight * -1;

  // 총 20개의 네비게이터 생성.
  { TODO -cRefactoring : i를 네비게이터 순서를 의미하는 것으로 변경 }
  for i := 0 to FLOOR_COUNT - 1 do
  begin
    FloorBGPnlArr[i] := TPanel.Create(Self);
    NamePnlArr[i]    := TPanel.Create(Self);

    CreateFloorBGPnls(FloorBGPnlArr[i], PnlTop);
    CreateNamePnls(NamePnlArr[i], FloorBGPnlArr[i], i);

    PnlTop := PnlTop + FNaviPnlHeight;

    { TODO -cRefactoring : j를 엘리베이터 순서를 의미하는 열거형으로 만들어서 사용 }
    for j := 0 to EV_COUNT - 1 do
    begin
      NaviBGPnlArr[j]  := TPanel.Create(Self);
      EVStatePnlArr[j] := TPanel.Create(Self);
      UpBtnArr[j]      := TButton.Create(Self);
      DownBtnArr[j]    := TButton.Create(Self);

      CreateNaviBGPnls(NaviBGPnlArr[j], FloorBGPnlArr[i], i, j, PnlLeft, PnlTop);
      CreateEVStatePnl(EVStatePnlArr[j], NaviBGPnlArr[j]);
      CreateUpBtns(UpBtnArr[j], NaviBGPnlArr[j]);
      CreateDownBtns(DownBtnArr[j], NaviBGPnlArr[j]);

      PnlLeft := PnlLeft + FNaviPnlWidth;
    end;
  end;
end;

procedure TFloorNavigator.DownBtnClick(Sender: TObject);
begin
  { TODO -cTest : 버튼 Sender 체크 }
  (Sender as TButton).Caption := STATE_DOWN_ON;
  ShowMessage('아래 예약. ' + (Sender as TButton).Parent.Name);
end;

procedure TFloorNavigator.CreateNaviBGPnls(NaviBGPnl, ParentPnl: TPanel; FloorIdx, NaviIdx, Left, Top: Integer);
var
  LastIdx: Integer;

begin
  NaviBGPnl.Parent := ParentPnl;
  NaviBGPnl.Align  := alLeft;
  NaviBGPnl.Width  := FNaviPnlWidth;
  LastIdx := Length(FFloorNameArr) - 1;
  NaviBGPnl.Name := 'FloorNavi' + '_' + FFloorNameArr[LastIdx - FloorIdx] + '_' + IntToStr(NaviIdx);
end;

procedure TFloorNavigator.CreateDownBtns(DownBtn: TButton; ParentPnl: TPanel);
begin
  DownBtn.Parent  := ParentPnl;
  DownBtn.Align   := alBottom;
  DownBtn.Caption := STATE_DOWN_OFF;
  DownBtn.OnClick := DownBtnClick;
end;

procedure TFloorNavigator.CreateEVStatePnl(EVStatePnl, ParentPnl: TPanel);
begin
  EVStatePnl.Parent     := ParentPnl;
  EVStatePnl.Align      := alClient;
  EVStatePnl.BevelOuter := bvNone;
  EVStatePnl.Caption    := 'Wait';
end;

procedure TFloorNavigator.CreateFloorBGPnls(FloorBGPnl: TPanel; Top: Integer);
begin
  FloorBGPnl.Parent := Self;
  FloorBGPnl.Align  := alTop;
  FloorBGPnl.Top    := Top;
  FloorBGPnl.Height := FNaviPnlHeight;
end;

procedure TFloorNavigator.InitFloorNameArr;
var
  i: Integer;

begin
  SetLength(FFloorNameArr, FLOOR_COUNT);

  for i := 0 to Length(FFloorNameArr) - 1 do
  begin
    if i < BASEMENT_RANGE then
      FFloorNameArr[i] := 'B' + IntToStr(BASEMENT_RANGE - i) + 'F'
    else
      FFloorNameArr[i] := IntToStr(i - 4) + 'F';
  end;
end;

procedure TFloorNavigator.InitFloorPnlSize;
begin
  FNaviPnlWidth  := Trunc(Self.Width / 5);
  FNaviPnlHeight := 200;
end;

procedure TFloorNavigator.CreateNamePnls(NamePnl, ParentPnl: TPanel; Idx: Integer);
var
  LastIdx: Integer;

begin
  NamePnl.Parent           := ParentPnl;
  NamePnl.Align            := alTop;
  NamePnl.BorderStyle      := bsSingle;
  NamePnl.ParentBackground := False;

  if idx >= 15 then
  begin
    NamePnl.Color      := clGray;
    NamePnl.Font.Color := clWhite;
  end;
  NamePnl.Font.Style := [fsBold];

  LastIdx := Length(FFloorNameArr) - 1;
  NamePnl.Caption := FFloorNameArr[LastIdx - Idx];
end;

procedure TFloorNavigator.CreateUpBtns(UpBtn: TButton; ParentPnl: TPanel);
begin
  UpBtn.Parent  := ParentPnl;
  UpBtn.Align   := alBottom;
  UpBtn.Caption := STATE_UP_OFF;
  UpBtn.OnClick := UpBtnClick;
end;

procedure TFloorNavigator.UpBtnClick(Sender: TObject);
begin
  { TODO -cTest : 버튼 Sender 체크 }
  (Sender as TButton).Caption := STATE_UP_ON;
  ShowMessage('위 예약. ' + (Sender as TButton).Parent.Name);
end;

end.
