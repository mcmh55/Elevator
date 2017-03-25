unit FrameTopNavigatorArea;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FrameEVLocationNavigator,
  FrameFloorNavigator, Vcl.StdCtrls, Vcl.ExtCtrls, Constants;

type
  TTopNavigatorArea = class(TFrame)
    EVLocationNavagator: TEVLocationNavagator;
    FloorNavigator: TFloorNavigator;
    procedure FrameMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FrameMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);

  private

  const
    SCROLL_POSITION = 20;

  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

{ TTopNavigatorArea }

constructor TTopNavigatorArea.Create(AOwner: TComponent);
begin
  inherited;

end;
procedure TTopNavigatorArea.FrameMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position + SCROLL_POSITION;
end;

procedure TTopNavigatorArea.FrameMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  VertScrollBar.Position := VertScrollBar.Position - SCROLL_POSITION;
end;

end.
