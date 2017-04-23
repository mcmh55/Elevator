unit EV.Model.Bean;

interface

uses
  System.SysUtils;

type
  EEVBeanException = class(Exception);

  TFloorMoveRange = (fmrAll, fmrLow, fmrHigh, fmrOdd, fmrEven);

  TMoveState = (msStop, msUp, msDown);

  TWorkState = (wsNormal, wsFull, wsBroken, wsRepair);

  TEVBean = record
  private
    FFloorMoveRange: TFloorMoveRange;
    FCurrentFloor: Double;
    FSpeed: Double;
    FDoorTime: Double;
    FWeightLimit: Double;
    FMoveState: TMoveState;
    FWorkState: TWorkState;
    FDoorOpenState: Boolean;
    procedure SetCurrentFloor(const Value: Double);
    procedure SetDoorState(const Value: Boolean);
    procedure SetFloorMoveRange(const Value: TFloorMoveRange);
    procedure SetMoveState(const Value: TMoveState);
    procedure SetSpeed(const Value: Double);
    procedure SetWeightLimit(const Value: Double);
    procedure SetWorkState(const Value: TWorkState);
    procedure SetDoorTime(const Value: Double);

    procedure InitCommon();
    procedure InitAllFloorType();
    procedure InitLowFloorType();
    procedure InitHighFloorType();
    procedure InitOddFloorType();
    procedure InitEvenFloorType();
  private const
    INVALID_INIT_TYPE = '초기화 할 수 없는 타입';
  public
    procedure Initialize(FloorMoveRange: TFloorMoveRange);

    property FloorMoveRange: TFloorMoveRange read FFloorMoveRange write SetFloorMoveRange;
    property CurrentFloor: Double read FCurrentFloor write SetCurrentFloor;
    property Speed: Double read FSpeed write SetSpeed;
    property DoorTime: Double read FDoorTime write SetDoorTime;
    property WeightLimit: Double read FWeightLimit write SetWeightLimit;
    property MoveState: TMoveState read FMoveState write SetMoveState;
    property WorkState: TWorkState read FWorkState write SetWorkState;
    property DoorState: Boolean read FDoorOpenState write SetDoorState;
  end;

implementation

{ TEVBean }

procedure TEVBean.InitAllFloorType;
begin
  FFloorMoveRange := fmrAll;
end;

procedure TEVBean.InitCommon;
begin
  FCurrentFloor   := 0.0;
  FSpeed          := 0.1;
  FDoorTime       := 2.0;
  FWeightLimit    := 1000.0;
  FMoveState      := msStop;
  FWorkState      := wsNormal;
  FDoorOpenState  := True;
end;

procedure TEVBean.InitEvenFloorType;
begin
  FFloorMoveRange := fmrEven;
end;

procedure TEVBean.InitHighFloorType;
begin
  FFloorMoveRange := fmrHigh;
  FSpeed          := 0.3;
end;

procedure TEVBean.InitLowFloorType;
begin
  FFloorMoveRange := fmrLow;
end;

procedure TEVBean.InitOddFloorType;
begin
  FFloorMoveRange := fmrOdd;
end;

procedure TEVBean.Initialize(FloorMoveRange: TFloorMoveRange);
begin
  InitCommon();

  case FloorMoveRange of
    fmrAll:  InitAllFloorType();
    fmrLow:  InitLowFloorType();
    fmrHigh: InitHighFloorType();
    fmrOdd:  InitOddFloorType();
    fmrEven: InitEvenFloorType();
  else
    raise EEVBeanException.Create(INVALID_INIT_TYPE);
  end;
end;

procedure TEVBean.SetCurrentFloor(const Value: Double);
begin
  FCurrentFloor := Value;
end;

procedure TEVBean.SetDoorState(const Value: Boolean);
begin
  FDoorOpenState := Value;
end;

procedure TEVBean.SetDoorTime(const Value: Double);
begin
  FDoorTime := Value;
end;

procedure TEVBean.SetFloorMoveRange(const Value: TFloorMoveRange);
begin
  FFloorMoveRange := Value;
end;

procedure TEVBean.SetMoveState(const Value: TMoveState);
begin
  FMoveState := Value;
end;

procedure TEVBean.SetSpeed(const Value: Double);
begin
  FSpeed := Value;
end;

procedure TEVBean.SetWeightLimit(const Value: Double);
begin
  FWeightLimit := Value;
end;

procedure TEVBean.SetWorkState(const Value: TWorkState);
begin
  FWorkState := Value;
end;

end.
