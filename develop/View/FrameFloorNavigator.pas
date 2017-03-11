unit FrameFloorNavigator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFloorNavigator = class(TFrame)
  private
    FFloorNameArr: array of string;
    FOnBtnClick: TNotifyEvent;

    procedure CreateNavigator();
    procedure InitBGPnls(BGPnl: TPanel; Idx, Left, Top: Integer);
    procedure InitNamePnls(NamePnl, ParentPnl: TPanel; Idx: Integer);
    procedure InitUpBtns(UpBtn: TButton; ParentPnl: TPanel);
    procedure InitDownBtns(DownBtn: TButton; ParentPnl: TPanel);
    procedure InitEVStatePnl(EVStatePnl, ParentPnl: TPanel);
    procedure InitFloorNameArr();

  public
    constructor Create(AOwner: TComponent); override;

    procedure UpBtnClick(Sender: TObject);
    procedure DownBtnClick(Sender: TObject);
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

  InitFloorNameArr();
  CreateNavigator();
end;

procedure TFloorNavigator.CreateNavigator;
var
  BGPnlArr, NamePnlArr, EVStatePnlArr: array of TPanel;
  UpBtnArr, DownBtnArr: array of TButton;
  PnlLeft, PnlTop : Integer;
  i: Integer;

begin
  SetLength(BGPnlArr, FLOOR_COUNT);
  SetLength(NamePnlArr, FLOOR_COUNT);
  SetLength(EVStatePnlArr, FLOOR_COUNT);
  SetLength(UpBtnArr, FLOOR_COUNT);
  SetLength(DownBtnArr, FLOOR_COUNT);

  // 왼쪽 아래부터 생성하기 위한 초기값
  PnlLeft := -150;
  PnlTop  := 200;

  // 총 20개의 네비게이터 생성.
  for i := 0 to FLOOR_COUNT - 1 do
  begin
    BGPnlArr[i]      := TPanel.Create(Self);
    NamePnlArr[i]    := TPanel.Create(Self);
    EVStatePnlArr[i] := TPanel.Create(Self);
    UpBtnArr[i]      := TButton.Create(Self);
    DownBtnArr[i]    := TButton.Create(Self);

    // 윗 줄로 위치 초기화
    if i = (FLOOR_COUNT / 2) then
    begin
      PnlLeft := -150;
      PnlTop  := 0;
    end;

    InitBGPnls(BGPnlArr[i], i, PnlLeft, PnlTop);
    InitNamePnls(NamePnlArr[i], BGPnlArr[i], i);
    InitEVStatePnl(EVStatePnlArr[i], BGPnlArr[i]);
    InitUpBtns(UpBtnArr[i], BGPnlArr[i]);
    InitDownBtns(DownBtnArr[i], BGPnlArr[i]);

    PnlLeft := PnlLeft + 150;
  end;
end;

procedure TFloorNavigator.DownBtnClick(Sender: TObject);
begin
  // TODO -cTest : 버튼 Sender 체크
  (Sender as TButton).Caption := STATE_DOWN_ON;
  ShowMessage('아래 예약. ' + (Sender as TButton).Parent.Name);
end;

procedure TFloorNavigator.InitBGPnls(BGPnl: TPanel; Idx, Left, Top: Integer);
const
  FLOOR_AREA_WIDTH  = 150;
  FLOOR_AREA_HEIGHT = 200;

begin
  BGPnl.Parent := Self;
  BGPnl.Width  := FLOOR_AREA_WIDTH;
  BGPnl.Height := FLOOR_AREA_HEIGHT;
  BGPnl.Left   := Left + FLOOR_AREA_WIDTH;
  BGPnl.Top    := Top;
  BGPnl.Name   := 'FloorNavi_' + FFloorNameArr[Idx];
end;

procedure TFloorNavigator.InitDownBtns(DownBtn: TButton; ParentPnl: TPanel);
begin
  DownBtn.Parent  := ParentPnl;
  DownBtn.Align   := alBottom;
  DownBtn.Caption := STATE_DOWN_OFF;
  DownBtn.OnClick := DownBtnClick;
end;

procedure TFloorNavigator.InitEVStatePnl(EVStatePnl, ParentPnl: TPanel);
begin
  EVStatePnl.Parent     := ParentPnl;
  EVStatePnl.Align      := alClient;
  EVStatePnl.BevelOuter := bvNone;
  EVStatePnl.Caption    := 'Wait';
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

procedure TFloorNavigator.InitNamePnls(NamePnl, ParentPnl: TPanel; Idx: Integer);
begin
  NamePnl.Parent      := ParentPnl;
  NamePnl.Align       := alTop;
  NamePnl.Caption     := FFloorNameArr[Idx];
  NamePnl.BorderStyle := bsSingle;
end;

procedure TFloorNavigator.InitUpBtns(UpBtn: TButton; ParentPnl: TPanel);
begin
  UpBtn.Parent  := ParentPnl;
  UpBtn.Align   := alBottom;
  UpBtn.Caption := STATE_UP_OFF;
  UpBtn.OnClick := UpBtnClick;
end;

procedure TFloorNavigator.UpBtnClick(Sender: TObject);
begin
  // TODO -cTest : 버튼 Sender 체크
  (Sender as TButton).Caption := STATE_UP_ON;
  ShowMessage('위 예약. ' + (Sender as TButton).Parent.Name);
end;

end.
